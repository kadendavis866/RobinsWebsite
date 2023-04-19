type Unit* = enum L gal m3

proc convertToL(startUnit: Unit, value: var float) =
    case startUnit
    of L:
        discard
    of gal:
        value = value * 3.78541
    of m3:
        value = value * 1000

proc convertToGAL(startUnit: Unit, value: var float) =
    case startUnit
    of L:
        value = value / 3.78541
    of gal:
        discard
    of m3:
        value = value * 264.172

proc convertToM3(startUnit: Unit, value: var float) =
    case startUnit
    of L:
        value = value / 1000
    of gal:
        value = value / 264.172
    of m3:
        discard

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    var retVal = value 
    if(endUnit == Unit.L):
        convertToL(startUnit,retVal)
    if(endUnit == Unit.gal):
        convertToGAL(startUnit,retval)
    if(endUnit == Unit.m3):
        convertToM3(startUnit,retval)
    return retVal