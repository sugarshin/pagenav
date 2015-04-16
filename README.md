# pagenav

[![Build Status](https://travis-ci.org/sugarshin/pagenav.svg?branch=master)](https://travis-ci.org/sugarshin/pagenav) [![GitHub version](https://badge.fury.io/gh/sugarshin%2Fpagenav.svg)](http://badge.fury.io/gh/sugarshin%2Fpagenav) [![License](http://img.shields.io/:license-mit-blue.svg)](http://sugarshin.mit-license.org/)

Pagenav

```
npm i sugarshin/pagenav
```

## Usage

```js
var Pagenav = require('pagenav');

var p = new Pagenav(element, {
  onActivate: (p) => {
    console.log(p);
  }
});

p.isInview(windowScrollTop); // => p
```

### Config

default options

```js
{
  offset: 0,
  range: 0,
  onActivate: (p) => {},
  onDeactivate: (p) => {}
}
```

## Contributing

**Incomplete**

```shell
npm test
```

## License

[MIT](http://sugarshin.mit-license.org/)

© sugarshin
