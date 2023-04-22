# result variable

type Unit* = enum mg g kg oz lb 

proc convertToMG(startUnit: Unit, value: float): float =
    case startUnit
    of mg:
        result = value
    of g:
        result = value * 1000
    of kg:
        result = value * 1000000
    of oz:
        result = value * 28349.5
    of lb:
        result = value * 453592
    return result

proc convertFromMG(value: float, endUnit: Unit): float =
    case endUnit
    of mg:
        result = value
    of g:
        result = value / 1000
    of kg:
        result = value / 1000000
    of oz:
        result = value / 28349.5
    of lb:
        result = value / 453592
    return result

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float =
    result = convertToMG(startUnit, value)
    result = convertFromMG(result, endUnit)
    return result