type Unit* = enum second minute hour day week month year

proc convertToSEC(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      discard
  of minute:
      value = value * 60
  of hour:
      value = value * 3600
  of day:
      value = value * 86400
  of week:
      value = value * 604800
  of month:
      value = value * 2629746
  of year:
      value = value * 31556952

proc convertToMIN(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      value = value / 60
  of minute:
      discard
  of hour:
      value = value * 60
  of day:
      value = value * 1440
  of week:
      value = value * 10080
  of month:
      value = value * 43800
  of year:
      value = value * 525600

proc convertToHOUR(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      value = value / 3600
  of minute:
      value = value / 60
  of hour:
      discard
  of day:
      value = value * 24
  of week:
      value = value * 168
  of month:
      value = value * 730.001
  of year:
      value = value * 8760

proc convertToDAY(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      value = value / 86400
  of minute:
      value = value / 1440
  of hour:
      value = value / 24
  of day:
      discard
  of week:
      value = value * 7
  of month:
      value = value * 30.4167
  of year:
      value = value * 365

proc convertToWEEK(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      value = value / 604800
  of minute:
      value = value / 10080
  of hour:
      value = value / 168
  of day:
      value = value / 7
  of week:
      discard
  of month:
      value = value * 4.34524
  of year:
      value = value * 52.1429

proc convertToMONTH(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      value = value / 2629746
  of minute:
      value = value / 43800
  of hour:
      value = value / 730
  of day:
      value = value / 30.417
  of week:
      value = value / 4.34524
  of month:
      discard
  of year:
      value = value * 12

proc convertToYEAR(startUnit: Unit, value: var float) =
  case startUnit
  of second:
      value = value / 31556952
  of minute:
      value = value / 525600
  of hour:
      value = value / 8760
  of day:
      value = value / 365
  of week:
      value = value / 52.143
  of month:
      value = value / 12
  of year:
      discard

proc convert*(startUnit: Unit, endUnit: Unit, value: float): float = 
    var retVal = value 
    if(endUnit == Unit.second):
        convertToSEC(startUnit,retVal)
    if(endUnit == Unit.minute):
        convertToMIN(startUnit,retval)
    if(endUnit == Unit.hour):
        convertToHOUR(startUnit,retval)
    if(endUnit == Unit.day):
        convertToDAY(startUnit,retval)
    if(endUnit == Unit.week):
        convertToWEEK(startUnit,retval)
    if(endUnit == Unit.month):
        convertToMONTH(startUnit,retval)
    if(endUnit == Unit.year):
        convertToYEAR(startUnit,retval)
    return retVal