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

