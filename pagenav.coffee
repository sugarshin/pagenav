###!
 * @license pagenav
 * (c) sugarshin
 * License: MIT
###

"use strict"

do (root = this, factory = ($, td) ->

  if td is undefined then td = $

  class Pagenav

    _$window = $(window)

    # https://github.com/klughammer/node-randomstring
    _getRandomString: do ->
      chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghiklmnopqrstuvwxyz'
      return (length = 32) ->
        string = ''
        for i in [0...length]
          randomNumber = Math.floor(Math.random() * chars.length)
          string += chars.substring(randomNumber, randomNumber + 1)
        return string

    _defaults:
      delayType: 'throttle'
      delay: 400
      offset: 0
      range: 0
      onActivate: (el) ->
      onDeactivate: (el) ->

    _configure: (el, opts) ->
      @$el = $(el)
      @$target = $(@$el.attr('href'))
      @opts = $.extend {}, @_defaults, opts
      @_namespace = @_getRandomString 16

    constructor: (@el, opts) ->
      @_configure @el, opts
      @activate _$window.scrollTop()
      @events()

    activate: (scrollTop) ->
      offset = @$target.offset().top - @opts.offset
      range = @$target.outerHeight() + @opts.range + offset

      if offset <= scrollTop < range
        @opts.onActivate @$el[0]
      else
        @opts.onDeactivate @$el[0]

    events: ->
      _$window.on "scroll.pagenav#{@_namespace}", td[@opts.delayType] @opts.delay, =>
        @activate _$window.scrollTop()
      return this

    unbind: ->
      _$window.off "scroll.pagenav#{@_namespace}"
      return this

) ->
  if typeof module is 'object' and typeof module.exports is 'object'
    module.exports = factory require('jquery'), require('throttle-debounce')
  else
    root.Pagenav or= factory root.jQuery
  return
