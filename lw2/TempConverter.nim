# Another way to return
# Reciever parameter
type Unit* = enum C F K

proc convertToC(value: float, startUnit: Unit): float =
    case startUnit
    of C:
        result = value
    of F:
        result = (value - 32) * 5 / 9
    of K:
        result = value - 273.15
    return

proc convertFromC(value: float, endUnit: Unit): float =
    case endUnit
    of C:
        result = value
    of F:
        result = value * 9 / 5 + 32
    of K:
        result += 273.15
    return

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float =
    result = value.convertToC(startUnit).convertFromC(endUnit)
    return