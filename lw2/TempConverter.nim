type Unit* = enum C F K

proc convertToC(startUnit: Unit, value: var float) =
    case startUnit
    of C:
        discard
    of F:
        value = (value - 32) * 5 / 9
    of K:
        value -= 273.15

proc convertFromC(value: var float, endUnit: Unit) =
    case endUnit
    of C:
        discard
    of F:
        value = value * 9 / 5 + 32
    of K:
        value += 273.15

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float =
    var retVal = value
    convertToC(startUnit, retVal)
    convertFromC(retVal, endUnit)
    return retVal