type Unit* = enum mm2 cm2 m2 km2 inch2 ft2 yd2 mi2

proc convertToMM(startUnit: Unit, value: var float) =
  case startUnit
  of mm2:
      discard
  of cm2:
      value = value * 10
  of m2:
      value = value * 1000
  of km2:
      value = value * 1000000
  of inch2:
      value = value * 25.4
  of ft2:
      value = value * 304.8
  of yd2:
      value = value * 914.4
  of mi2:
      value = value * 1609340

proc convertToCM(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value * 0.1
    of cm2:
        discard
    of m2:
        value = value * 100
    of km2:
        value = value * 100000
    of inch2:
        value = value * 2.54
    of ft2:
        value = value * 30.48
    of yd2:
        value = value * 91.44
    of mi2:
        value = value * 160934

proc convertToM(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value * 0.001
    of cm2:
        value = value * 0.1
    of m2:
        discard
    of km2:
        value = value * 1000
    of inch2:
        value = value * 0.0254
    of ft2:
        value = value * 0.3048
    of yd2:
        value = value * 0.9144
    of mi2:
        value = value * 1609.34

proc convertToKM(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value / 1000000
    of cm2:
        value = value / 100000
    of m2:
        value = value * 0.01
    of km2:
        discard
    of inch2:
        value = value * 0.0000254
    of ft2:
        value = value * 0.0003048
    of yd2:
        value = value * 0.0009144
    of mi2:
        value = value * 1.60934

proc convertToIN(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value * 0.0393701
    of cm2:
        value = value * 0.393701
    of m2:
        value = value * 39.3701
    of km2:
        value = value * 39370.1
    of inch2:
        discard
    of ft2:
        value = value * 12
    of yd2:
        value = value * 36
    of mi2:
        value = value * 63360

proc convertToFT(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value * 0.00328084
    of cm2:
        value = value * 0.0328084
    of m2:
        value = value * 3.28084
    of km2:
        value = value * 3280.84
    of inch2:
        value = value / 12
    of ft2:
        discard
    of yd2:
        value = value * 3
    of mi2:
        value = value * 5280

proc convertToYD(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value * 0.00109361
    of cm2:
        value = value * 0.0109361
    of m2:
        value = value * 1.09361
    of km2:
        value = value * 1093.61
    of inch2:
        value = value * 0.027778
    of ft2:
        value = value / 3
    of yd2:
        discard
    of mi2:
        value = value * 1760

proc convertToMI(startUnit: Unit, value: var float) =
    case startUnit
    of mm2:
        value = value * 0.000000621371
    of cm2:
        value = value * 0.00000621371
    of m2:
        value = value * 0.000621371
    of km2:
        value = value * 0.621371
    of inch2:
        value = value * 0.0000157828
    of ft2:
        value = value * 0.000189394
    of yd2:
        value = value * 0.000568182
    of mi2:
        discard

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    var retVal = value 
    if(endUnit == Unit.mm2):
        convertToMM(startUnit,retVal)
    if(endUnit == Unit.cm2):
        convertToCM(startUnit,retval)
    if(endUnit == Unit.m2):
        convertToM(startUnit,retval)
    if(endUnit == Unit.km2):
        convertToKM(startUnit,retval)
    if(endUnit == Unit.inch2):
        convertToIN(startUnit,retval)
    if(endUnit == Unit.ft2):
        convertToFT(startUnit,retval)
    if(endUnit == Unit.yd2):
        convertToYD(startUnit,retval)
    if(endUnit == Unit.mi2):
        convertToMI(startUnit,retval)
    return retVal
