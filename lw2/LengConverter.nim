# Pointers and returning parameters

type Unit* = enum mm cm m km inch ft yd mi

proc convertToMM(valuePtr: ptr float, startUnit: Unit): ptr float =
    case startUnit
    of mm:
        discard
    of cm:
        valuePtr[] *= 10
    of m:
        valuePtr[] *= 1000
    of km:
        valuePtr[] *= 1000000
    of inch:
        valuePtr[] *= 25.4
    of ft:
        valuePtr[] *= 304.8
    of yd:
        valuePtr[] *= 914.4
    of mi:
        valuePtr[] *= 1609340
    return valuePtr
    #[
        Note: when returning a parameter it must be one of the following:
            a pointer/reference
            the first argument of the procedure
    ]#

proc convertFromMM(valuePtr: ptr float, endUnit: Unit): ptr float =
    case endUnit
    of mm:
        discard
    of cm:
        valuePtr[] /= 10
    of m:
        valuePtr[] /= 1000
    of km:
        valuePtr[] /= 1000000
    of inch:
        valuePtr[] /= 25.4
    of ft:
        valuePtr[] /= 304.8
    of yd:
        valuePtr[] /= 914.4
    of mi:
        valuePtr[] /= 1609340
    return valuePtr

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    result = value
    discard addr(result).convertToMM(startUnit).convertFromMM(endUnit)
    #[
        for objects in heap memory:
            pointers can be traced or untraced
            traced:
                declared as ref T
                created using new
                garbage collected
            untraced:
                declared as ptr T
                created using alloc
                must be freed manually
    ]#
