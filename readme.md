# ATTENTION

This collection of batchfiles is from the pre-Yeoman age. Don't use it. Use advanced tools like [Yeoman](http://yeoman.io/) instead.

## Project kickstarter ##

This kickstarter allows you to create a complete web project folder structure with just a few keypresses. By default the generated structure is:

<pre>/
/assets
/assets/css
/assets/img
/assets/js
/assets/scss
/index.html</pre>

You are free to reconfigure this structure for each new project you start.

### Short instruction ###

First copy all files to your `windows\System32` directory. 

Then create a new folder for your project anywhere you want. 
Go to that folder in your Windows Explorer, press SHIFT+RIGHTCLICK in an empty area and select *Open command window here*. 
Type `kickstart` and select what you need!

If you decided to create sass/scss files (enabled by default) you can let sass watch the .scss files as you edit them by just typing `startwork` or just select *Start working* from the kickstarter options menu.


### Features ###

* Generate a full project folder structure (see above) with folders for your HTML, CSS, SCSS, JavaScript and images within seconds!
* Create complete HTML5, XHTML or HTML4 templates with (if you like) links to the Google CDN version of jQuery and an empty stylesheet
* Create empty CSS and JavaScript that will be placed in the according folder
* Type `startwork` to let SASS watch your scss changes. No more hassle with typing complicated stuff like `sass --watch path/to/my/scss:path/to/my/css`. SCSS directory is recognized automatically.


### Compatibility ###

All batch scripts were tested on a fresh Windows 7. Feel free to send bug reports if you find any.
