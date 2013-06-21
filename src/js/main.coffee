# Organize your frontend CoffeeScript here
console.log "Hello from Momo Fish Spa!"

(($) ->

	MomoMap =

		el:
			mapContainer:				$(".map-container")

		settings:
			styles: [
				"stylers": [
					"saturation":		-100,
					"gamma":			1,
					"lightness":		1
				]
			],
			latitude:					49.183625,
			longitude:					-2.110877

		init: ->
			@el.map = @initialiseMap()
			@bindEvents(@el.map)
			@showLocation(@el.map)

		initialiseMap: ->
			map = new google.maps.Map(@el.mapContainer[0],
				zoom: 					15,
				disableDefaultUI: 		true,
				disableDoubleClickZoom: true,
				draggable:				false,
				keyboardShortcuts:		false,
				scrollwheel:			false,
				center:					new google.maps.LatLng(@settings.latitude,@settings.longitude),
				mapTypeId:				google.maps.MapTypeId.ROADMAP,
				styles:					@settings.styles
			)

		bindEvents: (map) ->
			google.maps.event.addDomListener(map, 'idle', @resizeMap)
			google.maps.event.addDomListener(window, 'resize', @resizeMap)

		resizeMap: ->
			map = MomoMap.el.map
			x = map.getZoom()
			c = map.getCenter()
			google.maps.event.trigger(map, 'resize')
			map.setZoom(x)
			if(MomoMap.el.mapContainer.width()<500)
				map.setCenter(new google.maps.LatLng(MomoMap.settings.latitude, MomoMap.settings.longitude))
			else
				map.setCenter(c)

		showLocation: (map) ->
			usLocationMarker = null
			position = new google.maps.LatLng(@settings.latitude, @settings.longitude)

			if(usLocationMarker)
				return

			usLocationMarker = @addMarker(
				map,
				position,
				"Us!",
				""
			)

		addMarker: (map, position, label, icon)->
			marker = new google.maps.Marker(
				map: map,
				position: position,
				title: (label || "")
			)
			marker.setIcon(icon)
			return marker

	MomoMap.init()

) jQuery