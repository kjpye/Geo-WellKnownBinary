[![Actions Status](https://github.com/kjpye/Geo-WellKnownBinary/actions/workflows/test.yml/badge.svg)](https://github.com/kjpye/Geo-WellKnownBinary/actions)

TITLE
=====

Geo::WellKnownBinary

Geo::WellKnownBinary
====================

The `Geo::WellKnownBinary` module contains a single function:

from-wkb
--------

`from-wkb` takes a single `Buf` parameter, and returns a single `Geo::Geometry` object corresponding to the wkb specification, or a `Failure` if the contents of the Buff cannot be interpreted as a geometry object.

TODO
----

Many more tests are required. At the moment the tests are limited to fairly simple cases. Tests are definitely needed for polygons with holes (i.e. with those specifying more than one ring), and for multi-geometries with more than a single instance. But any additional test points will be gratefully received, especially if they are based on real data.

