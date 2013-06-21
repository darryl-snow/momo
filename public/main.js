(function() {
  console.log("Hello from Momo Fish Spa!");

  (function($) {
    var MomoMap;
    MomoMap = {
      el: {
        mapContainer: $(".map-container")
      },
      settings: {
        styles: [
          {
            "stylers": [
              {
                "saturation": -100,
                "gamma": 1,
                "lightness": 1
              }
            ]
          }
        ],
        latitude: 49.183625,
        longitude: -2.110877
      },
      init: function() {
        this.el.map = this.initialiseMap();
        this.bindEvents(this.el.map);
        return this.showLocation(this.el.map);
      },
      initialiseMap: function() {
        var map;
        return map = new google.maps.Map(this.el.mapContainer[0], {
          zoom: 15,
          disableDefaultUI: true,
          disableDoubleClickZoom: true,
          draggable: false,
          keyboardShortcuts: false,
          scrollwheel: false,
          center: new google.maps.LatLng(this.settings.latitude, this.settings.longitude),
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          styles: this.settings.styles
        });
      },
      bindEvents: function(map) {
        google.maps.event.addDomListener(map, 'idle', this.resizeMap);
        return google.maps.event.addDomListener(window, 'resize', this.resizeMap);
      },
      resizeMap: function() {
        var c, map, x;
        map = MomoMap.el.map;
        x = map.getZoom();
        c = map.getCenter();
        google.maps.event.trigger(map, 'resize');
        map.setZoom(x);
        if (MomoMap.el.mapContainer.width() < 500) {
          return map.setCenter(new google.maps.LatLng(MomoMap.settings.latitude, MomoMap.settings.longitude));
        } else {
          return map.setCenter(c);
        }
      },
      showLocation: function(map) {
        var position, usLocationMarker;
        usLocationMarker = null;
        position = new google.maps.LatLng(this.settings.latitude, this.settings.longitude);
        if (usLocationMarker) {
          return;
        }
        return usLocationMarker = this.addMarker(map, position, "Us!", "");
      },
      addMarker: function(map, position, label, icon) {
        var marker;
        marker = new google.maps.Marker({
          map: map,
          position: position,
          title: label || ""
        });
        marker.setIcon(icon);
        return marker;
      }
    };
    return MomoMap.init();
  })(jQuery);

}).call(this);
