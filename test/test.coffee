{ jsdom } = require 'jsdom'
global.document = jsdom '<html><body></body></html>'
global.window = document.defaultView
global.navigator = window.navigator

assert = require 'power-assert'

Pagenav = require '../src/pagenav.coffee'

# .test()
describe 'Pagenav', ->
  it 'constructor', ->
    a = document.createElement 'a'
    div = document.createElement 'div'
    a.href = '#id'
    div.id = 'id'
    document.body.appendChild a
    document.body.appendChild div
    assert new Pagenav a
