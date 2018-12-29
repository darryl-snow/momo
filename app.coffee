# A simple ExpressJS based boilerplate

express = require 'express'
coffee = require 'coffee-middleware'
stylus = require 'stylus'
nib = require 'nib'

# Putting our logic in ./routes/index.coffee
go = require './routes'

app = express()
# Change 'dev' to 'prod' when deploying to production
app.set('env', 'prod')

app.configure 'prod', ->

	compile = (str, path) ->
		stylus(str).set('filename', path).use nib()

	# Dev logger utility
	app.use express.logger 'dev'
	# Configuring stylus css
	app.use stylus.middleware
		src: "#{__dirname}/src/css/"
		dest: "#{__dirname}/public"
		warn: true
		compress: false
		compile: compile
	app.use coffee
		dest: "#{__dirname}/public"
		src: "#{__dirname}/src/js/"
		compress: false
		debug: true
		force: true

app.configure ->
	# Gzip served resources
	app.use express.compress()
	# Configuring jade views
	app.set 'view engine', 'jade'
	app.set 'views', "#{__dirname}/src/html"
	# Usefull Express provided middleware
	app.use express.bodyParser()
	# Put router before static to prevent useless disk seek at every request
	app.use app.router
	# Only show what is in /public
	app.use express.static "#{__dirname}/public"


# Assign your routes here, for example:
app.get '/', go.home


app.listen(9000)
console.log "App listening on 9000"
