###!
 * @license pagenav
 * (c) sugarshin
 * License: MIT
###

"use strict"

module.exports =
class Pagenav

  _extend: (out) ->
    out or= {}
    for i in [1...arguments.length]
      unless arguments[i] then continue
      for own k of arguments[i]
        out[k] = arguments[i][k]
    return out

  _getOffset: (el) ->
    rect = el.getBoundingClientRect()
    return {
      top: rect.top + document.body.scrollTop
      left: rect.left + document.body.scrollLeft
    }

  _getWindowScrollTop: ->
    return window.pageYOffset if window.pageYOffset
    if document.documentElement.clientHeight
      return document.documentElement.scrollTop
    else
      return document.body.scrollTop

  _defaults:
    offset: 0
    range: 0
    onActivate: (_this) ->
    onDeactivate: (_this) ->

  _configure: (el, opts) ->
    hash = @el.getAttribute('href').replace /\s?#\s?/, ''
    @targetEl = document.getElementById hash
    @opts = @_extend {}, @_defaults, opts

  constructor: (@el, opts) ->
    @_configure @el, opts
    @isInview @_getWindowScrollTop()

  isInview: (scrollTop) ->
    offset = @_getOffset(@targetEl).top - @opts.offset
    range = @targetEl.offsetHeight + @opts.range + offset

    if offset <= scrollTop < range
      @opts.onActivate @
    else
      @opts.onDeactivate @
