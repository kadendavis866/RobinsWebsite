type Unit* = enum mm cm m km inch ft yd mi

proc convertToMM(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        discard
    of cm:
        value = value * 10
    of m:
        value = value * 1000
    of km:
        value = value * 1000000
    of inch:
        value = value * 25.4
    of ft:
        value = value * 304.8
    of yd:
        value = value * 914.4
    of mi:
        value = value * 1609340

proc convertToCM(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value * .1
    of cm:
        discard
    of m:
        value = value * 100
    of km:
        value = value * 100000
    of inch:
        value = value * 2.54
    of ft:
        value = value * 30.48
    of yd:
        value = value * 91.44
    of mi:
        value = value * 160934

proc convertToM(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value * .001
    of cm:
        value = value * *.1
    of m:
        discard
    of km:
        value = value * 1000
    of inch:
        value = value * .0254
    of ft:
        value = value * .3048
    of yd:
        value = value * .9144
    of mi:
        value = value * 1609.34

proc convertToKM(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value / 1000000
    of cm:
        value = value / 100000
    of m:
        value = value * .01
    of km:
        discard
    of inch:
        value = value * .0000254
    of ft:
        value = value * .0003048
    of yd:
        value = value * .0009144
    of mi:
        value = value * 1.60934

proc convertToIN(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value * .0393701
    of cm:
        value = value * .393701
    of m:
        value = value * 39.3701
    of km:
        value = value * 39370.1
    of inch:
        discard
    of ft:
        value = value * 12
    of yd:
        value = value * 36
    of mi:
        value = value * 63360

proc convertToFT(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value * .00328084
    of cm:
        value = value * .0328084
    of m:
        value = value * 3.28084
    of km:
        value = value * 3280.84
    of inch:
        value = value / 12
    of ft:
        discard
    of yd:
        value = value * 3
    of mi:
        value = value * 5280

proc convertToYD(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value * .00109361
    of cm:
        value = value * .0109361
    of m:
        value = value * 1.09361
    of km:
        value = value * 1093.61
    of inch:
        value = value * .027778
    of ft:
        value = value / 3
    of yd:
        discard
    of mi:
        value = value * 1760

proc convertToMI(startUnit: Unit, value: var float) =
    case startUnit
    of mm:
        value = value * .000000621371
    of cm:
        value = value * .00000621371
    of m:
        value = value * .000621371
    of km:
        value = value * .621371
    of inch:
        value = value * .0000157828
    of ft:
        value = value * .000189394
    of yd:
        value = value * .000568182
    of mi:
        discard

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    var retVal = value 
    if(endUnit == Unit.mm):
        convertToMM(startUnit,endUnit,retVal)
    if(endUnit == Unit.cm):
        convertToCM(startUnit,endUnit,retval)
    if(endUnit == Unit.m):
        convertToM(startUnit,endUnit,retval)
    if(endUnit == Unit.km):
        convertToKM(startUnit,endUnit,retval)
    if(endUnit == Unit.inch):
        convertToIN(startUnit,endUnit,retval)
    if(endUnit == Unit.ft):
        convertToFT(startUnit,endUnit,retval)
    if(endUnit == Unit.yd):
        convertToYD(startUnit,endUnit,retval)
    if(endUnit == Unit.mi):
        convertToMI(startUnit,endUnit,retval)
    return retVal
