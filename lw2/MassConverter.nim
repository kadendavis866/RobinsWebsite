type Unit* = enum mg g kg oz lb 

proc convertToMG(startUnit: Unit, value: var float) =
    case startUnit
    of mg:
        discard
    of g:
        value = value * 1000
    of kg:
        value = value * 1000000
    of oz:
        value = value * 28349.5
    of lb:
        value = value * 453592

proc convertToG(startUnit: Unit, value: var float) =
    case startUnit
    of mg:
        value = value * 0.001
    of g:
        discard
    of kg:
        value = value * 1000
    of oz:
        value = value * 28.3495
    of lb:
        value = value * 453.592

proc convertToKG(startUnit: Unit, value: var float) =
    case startUnit
    of mg:
        value = value * 0.000001
    of g:
        value = value * 0.001
    of kg:
        discard
    of oz:
        value = value * 0.0283495
    of lb:
        value = value * 0.453592

proc convertToOZ(startUnit: Unit, value: var float) =
    case startUnit
    of mg:
        value = value * 0.000035274
    of g:
        value = value * 0.035274
    of kg:
        value = value * 35.274
    of oz:
        discard
    of lb:
        value = value * 453592

proc convertToLB(startUnit: Unit, value: var float) =
    case startUnit
    of mg:
        value = value * 0.00000220462
    of g:
        value = value * 0.00220462
    of kg:
        value = value * 2.20462
    of oz:
        value = value * 0.0625
    of lb:
        discard

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    var retVal = value 
    if(endUnit == Unit.mg):
        convertToMG(startUnit,retval)
    if(endUnit == Unit.g):
        convertToG(startUnit,retval)
    if(endUnit == Unit.kg):
        convertToKG(startUnit,retval)
    if(endUnit == Unit.oz):
        convertToOZ(startUnit,retval)
    if(endUnit == Unit.lb):
        convertToLB(startUnit,retval)
    return retVal