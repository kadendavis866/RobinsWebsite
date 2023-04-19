import strutils
from TempConverter as temp import nil
from LengConverter as length import nil
from MassConverter as mass import nil
from areaConverter as area import nil

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
            echo "C F K"
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
            echo "C F K"
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


proc convertLength() =
    var startUnit: length.Unit
    var endUnit: length.Unit
    var value: float
    var usrInput: string
    var valid = false
    while (not valid):
        valid = true
        stdout.write "From (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "mm cm m km inch ft yd mi"
            valid = false
        else:
            try:
                startUnit = parseEnum[length.Unit](usrInput)
            except ValueError:
                echo "invalid unit"
                valid = false
    valid = false
    while (not valid):
        valid = true
        stdout.write "To (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "mm cm m km inch ft yd mi"
            valid = false
        else:
            try:
                endUnit = parseEnum[length.Unit](usrInput)
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
    echo $(value) & $(startUnit) & " = " & $(length.convert(startUnit, endUnit, value)) & $(endUnit)

proc convertMass() =
    var startUnit: mass.Unit
    var endUnit: mass.Unit
    var value: float
    var usrInput: string
    var valid = false
    while (not valid):
        valid = true
        stdout.write "From (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "mg g kg oz lb "
            valid = false
        else:
            try:
                startUnit = parseEnum[mass.Unit](usrInput)
            except ValueError:
                echo "invalid unit"
                valid = false
    valid = false
    while (not valid):
        valid = true
        stdout.write "To (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "mg g kg oz lb "
            valid = false
        else:
            try:
                endUnit = parseEnum[mass.Unit](usrInput)
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
    echo $(value) & $(startUnit) & " = " & $(mass.convert(startUnit, endUnit, value)) & $(endUnit)

proc convertArea() =
    var startUnit: area.Unit
    var endUnit: area.Unit
    var value: float
    var usrInput: string
    var valid = false
    while (not valid):
        valid = true
        stdout.write "From (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "mm2 cm2 m2 km2 inch2 ft2 yd2 mi2"
            valid = false
        else:
            try:
                startUnit = parseEnum[area.Unit](usrInput)
            except ValueError:
                echo "invalid unit"
                valid = false
    valid = false
    while (not valid):
        valid = true
        stdout.write "To (help for options): "
        usrInput = readline(stdin)
        if (usrInput == "help"):
            echo "mm2 cm2 m2 km2 inch2 ft2 yd2 mi2"
            valid = false
        else:
            try:
                endUnit = parseEnum[area.Unit](usrInput)
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
    echo $(value) & $(startUnit) & " = " & $(area.convert(startUnit, endUnit, value)) & $(endUnit)



const unitTypes: array[6, string] = ["area", "length", "temperature", "volume", "mass", "time"]

var usrInput: string
var valid = false
while (not valid):
    valid = true
    stdout.write "Type of unit to convert (help for options): "
    usrInput = readLine(stdin)
    if (usrInput == unitTypes[0]):
        convertArea()
    elif (usrInput == unitTypes[1]):
        convertLength()
    elif (usrInput == unitTypes[2]):
        convertTemp()
    elif (usrInput == unitTypes[3]):
        echo "volume conversion not implemented yet"
    elif (usrInput == unitTypes[4]):
        convertMass()
    elif (usrInput == unitTypes[5]):
        echo "time conversion not implemented yet"
    elif (usrInput == "help"):
        echo "area length temperature volume mass time"
        valid = false
    else:
        echo "TODO print error message"
        valid = false