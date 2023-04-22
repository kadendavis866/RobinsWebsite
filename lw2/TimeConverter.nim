# Implicit returns

type Unit* = enum second minute hour day week month year

proc convertToSEC(value: float, startUnit: Unit): float =
    case startUnit
    of second:
        result = value
    of minute:
        result = value * 60
    of hour:
        result = value * 3600
    of day:
        result = value * 86400
    of week:
        result = value * 604800
    of month:
        result = value * 2629746
    of year:
        result = value * 31556952

proc convertFromSEC(value: float, endUnit: Unit): float =
    case endUnit
    of second:
        result = value
    of minute:
        result = value / 60
    of hour:
        result = value / 3600
    of day:
        result = value / 86400
    of week:
        result = value / 604800
    of month:
        result = value / 2629746
    of year:
        result = value / 31556952

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float =
    value.convertToSEC(startUnit).convertFromSEC(endUnit)