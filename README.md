# [Express Boilerplate](http://github.com/nepsilon/express-boilerplate)

A simple ExpressJS based boilerplate to get started with front-end development in no time.

## Features

* Auto compile [Stylus](http://learnboost.github.io/stylus/), [Jade](https://github.com/visionmedia/jade) and [CoffeeScript](http://coffeescript.org)
* Auto reload when any of the 3 compilers breaks or stops
* Verbose and colored logger for all 3 compilers and the HTTP server
* Include a collection of useful Stylus mixins from [Nib](https://github.com/visionmedia/nib)
* Output all CSS and JS code in `/public`
* Use [HTML5 Boilerplate](https://github.com/h5bp/html5-boilerplate) elements

## Getting Started

1. Clone the git repo: `git clone https://github.com/nepsilon/express-boilerplate.git <your project name>`
2. Then go to your working directory: `cd <your project name>`
3. Install the dependencies: `npm install .`
4. Launch the web server: `npm start` and see the page live at [http://localhost:9000](http://localhost:9000)

## Files Organization

```
 app.coffee (The backend app itself, add URL routes there if needed.)
 |-src
   |-css (You put your Stylus code here)
   |-html (You put your Jade tempaltes here)
   |-js (You put your CoffeeScript here)
 |-public
   |-favicon.ico
   |-robots.txt
   |-humans.txt
   |-application.js (It will be generated from your CoffeeScript at /src/js)
   |-application.css (It will be generated from your Stylus at /src/css)
 |-routes
   |-index.coffee (Here goes the backend controllers. You shouldn't need to change this a lot if only doing frontend work)
 |-node-modules (Nodejs dependencies)
   |- ...
     |- ... (Here goes the abbyss of dependencies..)
       |- ...
```
