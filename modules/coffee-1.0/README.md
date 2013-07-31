# Coffee script Play! plugin.

## Background

[CoffeeScript](http://jashkenas.github.com/coffee-script/) is a better way to produce JavaScript.  It provides some great language features that JS lacks (e.g. list comprehensions, multiline strings, string interpolation, destructuring assignment, etc), while cleaning up the syntax at the same time.  It compiles down to debuggable JS. 

## Objective

The goal is to make [CoffeeScript](http://jashkenas.github.com/coffee-script/) frictionless to use with [Play!](http://www.playframework.org) web framework.

## Overview 

This module integrates [Play!](http://www.playframework.org) with [Coffee script](http://jashkenas.github.com/coffee-script/).  It uses [JCoffeeScript](https://github.com/yeungda/jcoffeescript) to run the Coffee compiler (which is written in Coffee) on [Rhino](http://www.mozilla.org/rhino/).

This module provides two ways to write Coffee: 

*   Inline - write coffee right in your template
*   Included - keep your coffee in separate resource files

## Inline Coffee

You can write Coffee script directly in your Play! templates using the `#{coffee.inline}` tag.

For example:
    #{coffee.inline}
    # Array comprehensions:
    cubes = (math.cube num for num in [1, 2, 3])
    #{/}

will produce the compiled javascript directly into your page:
    <script type="text/javascript">
    (function() {
      var cubes;
      cubes = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = list.length; _i < _len; _i++) {
          num = list[_i];
          _results.push(math.cube(num));
        }
        return _results;
      })();
    }).call(this);
    </script>

### String interpolation

To use Coffee string interpolation, the syntax `#\{variable}` must be used.  This is to differentiate it from Play! tags.  

For example:
    #{coffee.inline}
    x = 5
    y = 8
    console.log "The value of x and y are #\{x} and #\{y}"
    #{/}

### Play! tags

All the usual Play! tags may be used within your Coffee.

For example:
    #{coffee.inline}
    query = "${query.raw()}"
    #{if logQuery} 
    console.log "The query was #\{query}"
    #{/if}
    #{/}

### Compilation errors

If there is an error compiling your Coffee, a 500 will be returned, and in development mode you will see the pretty Play! "Template compilation error" screen.  As usual, it shows you the error message plus the line of source code that caused the error.  

## Included Coffee

You can also write your Coffee in a separate file, including it via a script tag.

For example,
    <script type="text/javascript" href="@{'/public/javascripts/sample.coffee'}"></script>

The module handles the request and compiles the coffee on the fly.  

Note that Play! template tags may not be used in included coffee files, and String interpolation works according to the Coffee spec (e.g. `#{variable}`).  

### Caching

In general, Coffee is only re-compiled if it has changed since the last request (based on the file's last-modified date).  In the absence of changes to the source, the compiled Coffee is cached forever.

In production mode, a cache header is also set telling the client to cache the file for 1 hour.

### Compilation errors

A compilation error in an included file will cause the error to be logged and will return 500.  If the developer visits the resource link directly, he can see the useful compilation error screen showing the offending line.

## Getting started

This module is not yet on www.playframework.org.  

To use it in your Play! project:

1. Clone it into your play/modules directory
2. Run 'play build-module' in play/modules/play-coffee
3. Add the module to your application.conf / dependencies.yml file.

The *sample* application included in the module exercises all of the functionality in the module, making it a good reference.  It may be run by running 'play test' in the 'play-coffee/sample' directory.

## Feedback welcome. 

All feedback is very welcome.  Feel free to create Issues for feature requests or bugs.  