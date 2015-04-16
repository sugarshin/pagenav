(function(f){if(typeof exports==="object"&&typeof module!=="undefined"){module.exports=f()}else if(typeof define==="function"&&define.amd){define([],f)}else{var g;if(typeof window!=="undefined"){g=window}else if(typeof global!=="undefined"){g=global}else if(typeof self!=="undefined"){g=self}else{g=this}g.Pagenav = f()}})(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(_dereq_,module,exports){

/*!
 * @license pagenav
 * (c) sugarshin
 * License: MIT
 */
"use strict";
var Pagenav,
  hasProp = {}.hasOwnProperty;

module.exports = Pagenav = (function() {
  var _window;

  _window = window;

  Pagenav.prototype._extend = function(out) {
    var i, j, key, ref, ref1, val;
    out || (out = {});
    for (i = j = 1, ref = arguments.length; 1 <= ref ? j < ref : j > ref; i = 1 <= ref ? ++j : --j) {
      if (!arguments[i]) {
        continue;
      }
      ref1 = arguments[i];
      for (key in ref1) {
        if (!hasProp.call(ref1, key)) continue;
        val = ref1[key];
        out[key] = arguments[i][key];
      }
    }
    return out;
  };

  Pagenav.prototype._offset = function(el) {
    var rect;
    rect = el.getBoundingClientRect();
    return {
      top: rect.top + document.body.scrollTop,
      left: rect.left + document.body.scrollLeft
    };
  };

  Pagenav.prototype._getWindowScrollTop = function() {
    if (window.pageYOffset) {
      return window.pageYOffset;
    }
    if (document.documentElement.clientHeight) {
      return document.documentElement.scrollTo;
    } else {
      return document.body.scrollTop;
    }
  };

  Pagenav.prototype._defaults = {
    offset: 0,
    range: 0,
    onActivate: function(el) {},
    onDeactivate: function(el) {}
  };

  Pagenav.prototype._configure = function(el, opts) {
    var hash;
    hash = this.el.getAttribute('href').replace(/\s?#\s?/, '');
    this.targetEl = document.getElementById(hash);
    return this.opts = this._extend({}, this._defaults, opts);
  };

  function Pagenav(el1, opts) {
    this.el = el1;
    this._configure(this.el, opts);
    this.activate(this._getWindowScrollTop());
    this.events();
  }

  Pagenav.prototype.activate = function(scrollTop) {
    var offset, range;
    offset = _offset(this.targetEl).top - this.opts.offset;
    range = this.targetEl.offsetHeight + this.opts.range + offset;
    if ((offset <= scrollTop && scrollTop < range)) {
      return this.opts.onActivate(this.el);
    } else {
      return this.opts.onDeactivate(this.el);
    }
  };

  return Pagenav;

})();



},{}]},{},[1])(1)
});
