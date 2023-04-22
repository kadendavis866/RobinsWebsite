# variable parameters 
type Unit* = enum L gal m3

proc convertToL(value: var float, startUnit: Unit) =
    case startUnit
    of L:
        discard
    of gal:
        value *= 3.78541
    of m3:
        value *= 1000

proc convertFromL(value: var float, startUnit: Unit) =
    case startUnit
    of L:
        discard
    of gal:
        value /= 3.78541
    of m3:
        value /= 1000

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    result = value
    result.convertToL(startUnit)
    result.convertFromL(endUnit)