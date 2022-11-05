unit class Geo::WellKnownBinary;

use Geo::Geometry;

sub wkb-get-point($buff, $offset is rw, $endian) {
    my $x = $buff.read-num64($offset, $endian); $offset += 8;
    my $y = $buff.read-num64($offset, $endian); $offset += 8;
    Point.new($x, $y);
}

sub wkb-get-pointz($buff, $offset is rw, $endian) {
    my $x = $buff.read-num64($offset, $endian); $offset += 8;
    my $y = $buff.read-num64($offset, $endian); $offset += 8;
    my $z = $buff.read-num64($offset, $endian); $offset += 8;
    PointZ.new($x, $y, $z);
}

sub wkb-get-pointm($buff, $offset is rw, $endian) {
    my $x = $buff.read-num64($offset, $endian); $offset += 8;
    my $y = $buff.read-num64($offset, $endian); $offset += 8;
    my $m = $buff.read-num64($offset, $endian); $offset += 8;
    PointM.new($x, $y, $m);
}

sub wkb-get-pointzm($buff, $offset is rw, $endian) {
    my $x = $buff.read-num64($offset, $endian); $offset += 8;
    my $y = $buff.read-num64($offset, $endian); $offset += 8;
    my $z = $buff.read-num64($offset, $endian); $offset += 8;
    my $m = $buff.read-num64($offset, $endian); $offset += 8;
    PointZM.new($x, $y, $z, $m);
}

sub wkb-get-linearring($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LinearRing.new(points => ((^$num-points).map: {wkb-get-point($buff, $offset, $endian)}));
}

sub wkb-get-linearringz($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LinearRingZ.new(points => ((^$num-points).map: {wkb-get-pointz($buff, $offset, $endian)}));
}

sub wkb-get-linearringm($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LinearRingM.new(points => ((^$num-points).map: {wkb-get-pointm($buff, $offset, $endian)}));
}

sub wkb-get-linearringzm($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LinearRingZM.new(points => ((^$num-points).map: {wkb-get-pointzm($buff, $offset, $endian)}));
}

sub wkb-get-linestring($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LineString.new(points => ((^$num-points).map: {wkb-get-point($buff, $offset, $endian)}));
}

sub wkb-get-linestringz($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LineStringZ.new(points => ((^$num-points).map: {wkb-get-pointz($buff, $offset, $endian)}));
}

sub wkb-get-linestringm($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LineStringM.new(points => ((^$num-points).map: {wkb-get-pointm($buff, $offset, $endian)}));
}

sub wkb-get-linestringzm($buff, $offset is rw, $endian) {
    my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
    LineStringZM.new(points => ((^$num-points).map: {wkb-get-pointzm($buff, $offset, $endian)}));
}

sub wkb-get-polygon($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    Polygon.new(rings => ((^$num-rings).map: {wkb-get-linearring($buff, $offset, $endian)}));
}

sub wkb-get-polygonz($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    PolygonZ.new(rings => ((^$num-rings).map: {wkb-get-linearringz($buff, $offset, $endian)}));
}

sub wkb-get-polygonm($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    PolygonM.new(rings => ((^$num-rings).map: {wkb-get-linearringm($buff, $offset, $endian)}));
}

sub wkb-get-polygonzm($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    PolygonZM.new(rings => ((^$num-rings).map: {wkb-get-linearringzm($buff, $offset, $endian)}));
}

sub wkb-get-triangle($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    Triangle.new(rings => ((^$num-rings).map: {wkb-get-linearring($buff, $offset, $endian)}));
}

sub wkb-get-trianglez($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    TriangleZ.new(rings => ((^$num-rings).map: {wkb-get-linearringz($buff, $offset, $endian)}));
}

sub wkb-get-trianglem($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    TriangleM.new(rings => ((^$num-rings).map: {wkb-get-linearringm($buff, $offset, $endian)}));
}

sub wkb-get-trianglezm($buff, $offset is rw, $endian) {
    my $num-rings = $buff.read-uint32($offset, $endian); $offset += 4;
    TriangleZM.new(rings => ((^$num-rings).map: {wkb-get-linearringzm($buff, $offset, $endian)}));
}

sub wkb-read-geometry($buff, $offset is rw, $endian) {
    my $geometry;
    my $geometry-type = $buff.read-uint32($offset, $endian); $offset += 4;
    if $geometry-type +& 0x20000000 {
        $offset += 4; # skip SRID
        $geometry-type +^= 0x20000000;
    }
    given $geometry-type {
        when wkbPoint {
            $geometry = wkb-get-point($buff, $offset, $endian);
        }
        when wkbPointZ {
            $geometry = wkb-get-pointz($buff, $offset, $endian);
        }
        when wkbPointM {
            $geometry = wkb-get-pointm($buff, $offset, $endian);
        }
        when wkbPointZM {
            $geometry = wkb-get-pointzm($buff, $offset, $endian);
        }
        when wkbLineString {
            $geometry = wkb-get-linestring($buff, $offset, $endian);
        }
        when wkbLineStringZ {
            $geometry = wkb-get-linestringz($buff, $offset, $endian);
        }
        when wkbLineStringM {
            $geometry = wkb-get-linestringm($buff, $offset, $endian);
        }
        when wkbLineStringZM {
            $geometry = wkb-get-linestringzm($buff, $offset, $endian);
        }
        when wkbPolygon {
            $geometry = wkb-get-polygon($buff, $offset, $endian);
        }
        when wkbPolygonZ {
            $geometry = wkb-get-polygonz($buff, $offset, $endian);
        }
        when wkbPolygonM {
            $geometry = wkb-get-polygonm($buff, $offset, $endian);
        }
        when wkbPolygonZM {
            $geometry = wkb-get-polygonzm($buff, $offset, $endian);
        }
        when wkbTriangle {
            $geometry = wkb-get-triangle($buff, $offset, $endian);
        }
        when wkbTriangleZ {
            $geometry = wkb-get-trianglez($buff, $offset, $endian);
        }
        when wkbTriangleM {
            $geometry = wkb-get-trianglem($buff, $offset, $endian);
        }
        when wkbTriangleZM {
            $geometry = wkb-get-trianglezm($buff, $offset, $endian);
        }
        when wkbPolyhedralSurface {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = PolyhedralSurface.new(polygons => ((^$num-polygons).map: {wkb-get-polygon($buff, $offset, $endian)}));
        }
        when wkbPolyhedralSurfaceZ {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = PolyhedralSurfaceZ.new(polygons => ((^$num-polygons).map: {wkb-get-polygonz($buff, $offset, $endian)}));
        }
        when wkbPolyhedralSurfaceM {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = PolyhedralSurfaceM.new(polygons => ((^$num-polygons).map: {wkb-get-polygonm($buff, $offset, $endian)}));
        }
        when wkbPolyhedralSurfaceZM {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = PolyhedralSurfaceZM.new(polygons => ((^$num-polygons).map: {wkb-get-polygonzm($buff, $offset, $endian)}));
        }
        when wkbTIN {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = TIN.new(polygons => ((^$num-polygons).map: {wkb-get-polygon($buff, $offset, $endian)}));
        }
        when wkbTINZ {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = TINZ.new(polygons => ((^$num-polygons).map: {wkb-get-polygonz($buff, $offset, $endian)}));
        }
        when wkbTINM {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = TINM.new(polygons => ((^$num-polygons).map: {wkb-get-polygonm($buff, $offset, $endian)}));
        }
        when wkbTINZM {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = TINZM.new(polygons => ((^$num-polygons).map: {wkb-get-polygonzm($buff, $offset, $endian)}));
        }
        when wkbMultiPoint {
            my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPoint.new(polygons => ((^$num-points).map: {wkb-get-point($buff, $offset, $endian)}));
        }
        when wkbMultiPointZ {
            my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPointZ.new(polygons => ((^$num-points).map: {wkb-get-pointz($buff, $offset, $endian)}));
        }
        when wkbMultiPointM {
            my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPointM.new(polygons => ((^$num-points).map: {wkb-get-pointm($buff, $offset, $endian)}));
        }
        when wkbMultiPointZM {
            my $num-points = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPoint.newZM(polygons => ((^$num-points).map: {wkb-get-pointzm($buff, $offset, $endian)}));
        }
        when wkbMultiLineString {
            my $num-lines = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiLineString.new(linestrings => ((^$num-lines).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiLineStringZ {
            my $num-lines = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiLineStringZ.new(linestrings => ((^$num-lines).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiLineStringM {
            my $num-lines = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiLineStringM.new(linestrings => ((^$num-lines).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiLineStringZM {
            my $num-lines = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiLineStringZM.new(linestrings => ((^$num-lines).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiPolygon {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPolygon.new(polygons => ((^$num-polygons).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiPolygonZ {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPolygonZ.new(polygons => ((^$num-polygons).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiPolygonM {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPolygonM.new(polygons => ((^$num-polygons).map: {read-wkb($buff, $offset)}));
        }
        when wkbMultiPolygonZM {
            my $num-polygons = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = MultiPolygonZM.new(polygons => ((^$num-polygons).map: {read-wkb($buff, $offset)}));
        }
        when wkbGeometryCollection {
            my $num-geometries = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = GeometryCollection.new(geometries => ((^$num-geometries).map: {read-wkb($buff, $offset)}));
        }
        when wkbGeometryCollectionZ {
            my $num-geometries = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = GeometryCollectionZ.new(geometries => ((^$num-geometries).map: {read-wkb($buff, $offset)}));
        }
        when wkbGeometryCollectionM {
            my $num-geometries = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = GeometryCollectionM.new(geometries => ((^$num-geometries).map: {read-wkb($buff, $offset)}));
        }
        when wkbGeometryCollectionZM {
            my $num-geometries = $buff.read-uint32($offset, $endian); $offset += 4;
            $geometry = GeometryCollectionZM.new(geometries => ((^$num-geometries).map: {read-wkb($buff, $offset)}));
        }
        default { fail "Can't handle geometry type $geometry-type in from-wkb"; }
    }
    $geometry;
}
    
sub read-wkb(Buf $buff, $offset is rw) {
    my $length = $buff.elems;
    my $byteorder = $buff[$offset++] ?? wkbNDR !! wkbXDR;
    my $endian = $byteorder == wkbNDR ?? LittleEndian !! BigEndian;
    my $geometry = wkb-read-geometry $buff, $offset, $endian;
    fail "from-wkb: buffer too short" if $offset > $length;
    $geometry;
}

our sub from-wkb(Buf $buff) is export {
    my $offset = 0;
    read-wkb($buff, $offset);
}
