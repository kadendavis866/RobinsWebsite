import strutils

proc toLiters(value: float, unit: string): float =
    case unit:
    of "L", "l":
        return value
    of "gal", "GAL":
        return value * 3.78541
    of "m3", "M3":
        return value * 1_000.0
    else:
        raise newException(ValueError, "Invalid input unit")

proc fromLiters(value: float, unit: string): float =
    case unit:
    of "L", "l":
        return value
    of "gal", "GAL":
        return value / 3.78541
    of "m3", "M3":
        return value / 1_000.0
    else:
        raise newException(ValueError, "Invalid output unit")

echo("Welcome to the volume conversion tool! Please select the conversion you want to perform:")
echo("1. Liters (L) to gallons (gal)")
echo("2. Gallons (gal) to liters (L)")
echo("3. Liters (L) to cubic meters (m3)")
echo("4. Cubic meters (m3) to liters (L)")

var conversionOption: string
var inputValue: float
var inputUnit: string
var outputUnit: string
var validInput: bool = false

while not validInput:
    conversionOption = readLine(stdin)
    case conversionOption
    of "1":
        echo("You have selected Liters (L) to gallons (gal)")
        echo("Please enter the volume value you want to convert (in liters):")
        inputUnit = "L"
        outputUnit = "gal"
        validInput = true
    of "2":
        echo("You have selected Gallons (gal) to liters (L)")
        echo("Please enter the volume value you want to convert (in gallons):")
        inputUnit = "gal"
        outputUnit = "L"
        validInput = true
    of "3":
        echo("You have selected Liters (L) to cubic meters (m3)")
        echo("Please enter the volume value you want to convert (in liters):")
        inputUnit = "L"
        outputUnit = "m3"
        validInput = true
    of "4":
        echo("You have selected Cubic meters (m3) to liters (L)")
        echo("Please enter the volume value you want to convert (in cubic meters):")
        inputUnit = "m3"
        outputUnit = "L"
        validInput = true
    else:
        echo("Invalid option. Please select a valid option.")
        validInput = false

inputValue = parseFloat(readLine(stdin))

try:
    let volumeInLiters = toLiters(inputValue, inputUnit)
    let convertedVolume = fromLiters(volumeInLiters, outputUnit)
    echo(inputValue, " ", inputUnit, " = ", convertedVolume, " ", outputUnit)
except ValueError:
    echo("Invalid unit. Please enter a valid unit.")