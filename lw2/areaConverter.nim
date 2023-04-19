import strutils

proc toSquareMeters(value: float, unit: string): float =
    case unit:
    of "m2", "sqm":
        return value
    of "ft2", "sqft":
        return value * 0.092903
    of "km2", "sqkm":
        return value * 1_000_000.0
    of "mi2", "sqmi":
        return value * 2_589_988.11
    else:
        raise newException(ValueError, "Invalid input unit")

proc fromSquareMeters(value: float, unit: string): float =
    case unit:
    of "m2", "sqm":
        return value
    of "ft2", "sqft":
        return value / 0.092903
    of "km2", "sqkm":
        return value / 1_000_000.0
    of "mi2", "sqmi":
        return value / 2_589_988.11
    else:
        raise newException(ValueError, "Invalid output unit")

echo("Welcome to the area conversion tool! Please select the conversion you want to perform:")
echo("1. Square meters (m2/sqm) to square feet (ft2/sqft)")
echo("2. Square feet (ft2/sqft) to square meters (m2/sqm)")
echo("3. Square kilometers (km2/sqkm) to square miles (mi2/sqmi)")
echo("4. Square miles (mi2/sqmi) to square kilometers (km2/sqkm)")

var conversionOption: string
var inputValue: float
var inputUnit: string
var outputUnit: string
var validInput: bool = false

while not validInput:
    conversionOption = readLine(stdin)
    case conversionOption
    of "1":
        echo("You have selected Square meters (m2/sqm) to square feet (ft2/sqft)")
        echo("Please enter the area value you want to convert (in square meters):")
        inputUnit = "m2"
        outputUnit = "ft2"
        validInput = true
    of "2":
        echo("You have selected Square feet (ft2/sqft) to square meters (m2/sqm)")
        echo("Please enter the area value you want to convert (in square feet):")
        inputUnit = "ft2"
        outputUnit = "m2"
        validInput = true
    of "3":
        echo("You have selected Square kilometers (km2/sqkm) to square miles (mi2/sqmi)")
        echo("Please enter the area value you want to convert (in square kilometers):")
        inputUnit = "km2"
        outputUnit = "mi2"
        validInput = true
    of "4":
        echo("You have selected Square miles (mi2/sqmi) to square kilometers (km2/sqkm)")
        echo("Please enter the area value you want to convert (in square miles):")
        inputUnit = "mi2"
        outputUnit = "km2"
        validInput = true
    else:
        echo("Invalid option. Please select a valid option.")
        validInput = false

inputValue = parseFloat(readLine(stdin))

try:
    let areaInSquareMeters = toSquareMeters(inputValue, inputUnit)
    let convertedArea = fromSquareMeters(areaInSquareMeters, outputUnit)
    echo(inputValue, " ", inputUnit, " = ", convertedArea, " ", outputUnit)
except ValueError:
    echo("Invalid unit. Please enter a valid unit.")