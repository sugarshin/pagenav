# pagenav

[![Build Status](https://travis-ci.org/sugarshin/pagenav.svg?branch=master)](https://travis-ci.org/sugarshin/pagenav) [![Coverage Status](https://coveralls.io/repos/sugarshin/pagenav/badge.svg)](https://coveralls.io/r/sugarshin/pagenav) [![GitHub version](https://badge.fury.io/gh/sugarshin%2Fpagenav.svg)](http://badge.fury.io/gh/sugarshin%2Fpagenav) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

Pagenav

```shell
npm i sugarshin/pagenav
```

## Usage

```coffeescript
Pagenav = require 'pagenav'

new Pagenav element, opts
```

or

```html
<script src="jquery.js"></script>
<script src="throttle-debounce.js"></script>
<script src="pagenav.js"></script>
<script>
  new Pagenav(element, opts);
</script>
```

### Config

options

```coffeescript
_defaults:
  delayType: 'throttle'
  delay: 400
  offset: 0
  range: 0
  onActivate: (el) ->
  onDeactivate: (el) ->
```

## Contributing

[CoffeeScript](//coffeescript.org/)

[mocha-phantomjs](//github.com/metaskills/mocha-phantomjs)

[power-assert](//github.com/twada/power-assert)

```shell
npm test
```

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin
