# basic/normal procs
# type inference
type Unit* = enum mm2 cm2 m2 km2 inch2 ft2 yd2 mi2

proc convertToMM2(startUnit: Unit, value: float): float =
    var retVal = value
    case startUnit
    of mm2:
        discard
    of cm2:
        retVal = value * 100
    of m2:
        retVal = value * 1e6
    of km2:
        retVal = value * 1e12
    of inch2:
        retVal = value * 645.16
    of ft2:
        retVal = value * 92903.04
    of yd2:
        retVal = value * 836127.36
    of mi2:
        retVal = value * 2589988110336.0
    return retVal

proc convertFromMM(value: float, endUnit: Unit): float =
    var retVal = value
    case endUnit
    of mm2:
        discard
    of cm2:
        retVal = value / 100
    of m2:
        retVal = value / 1e6
    of km2:
        retVal = value / 1e12
    of inch2:
        retVal = value / 645.16
    of ft2:
        retVal = value / 92903.04
    of yd2:
        retVal = value / 836127.36
    of mi2:
        retVal = value / 2589988110336.0
    return retVal

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    var retVal: float
    retVal = convertToMM2(startUnit, value)
    retVal = convertFromMM(retVal, endUnit)
    return retVal
