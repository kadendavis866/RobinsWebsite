import strutils
from TempConverter as temp import nil

proc convertTemp() =
    var startUnit: temp.Unit
    var endUnit: temp.Unit
    var value: float
    var usrInput: string
    var valid = false
    while (not valid):
        valid = true
        stdout.write "From (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "TODO print valid units"
            valid = false
        else:
            try:
                startUnit = parseEnum[temp.Unit](usrInput)
            except ValueError:
                echo "invalid unit"
                valid = false
    valid = false
    while (not valid):
        valid = true
        stdout.write "To (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "TODO print valid units"
            valid = false
        else:
            try:
                endUnit = parseEnum[temp.Unit](usrInput)
            except ValueError:
                echo "invalid unit"
                valid = false
    valid = false
    while (not valid):
        valid = true
        stdout.write "Value: "
        usrInput = readline(stdin)
        try:
            value = parseFloat(usrInput)
        except ValueError:
            echo "invalid value"
            valid = false
    echo $(value) & $(startUnit) & " = " & $(temp.convert(startUnit, endUnit, value)) & $(endUnit)

const unitTypes: array[7, string] = ["area", "length", "temperature", "volume", "mass", "speed", "time"]

var usrInput: string
var valid = false
while (not valid):
    valid = true
    stdout.write "Type of unit to convert (help for options): "
    usrInput = readLine(stdin)
    if (usrInput == unitTypes[0]):
        echo "area conversion not implemented yet"
    elif (usrInput == unitTypes[1]):
        echo "length conversion not implemented yet"
    elif (usrInput == unitTypes[2]):
        convertTemp()
    elif (usrInput == unitTypes[3]):
        echo "volume conversion not implemented yet"
    elif (usrInput == unitTypes[4]):
        echo "mass conversion not implemented yet"
    elif (usrInput == unitTypes[5]):
        echo "speed conversion not implemented yet"
    elif (usrInput == unitTypes[6]):
        echo "time conversion not implemented yet"
    elif (usrInput == "help"):
        echo "print unit types"
        valid = false
    else:
        echo "TODO print error message"
        valid = false