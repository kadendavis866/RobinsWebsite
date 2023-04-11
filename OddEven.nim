#Compile instructions
#[nim compile --run OddEven.nim
  shortened compile command
  nim c -r OddEven.nim
]#
import strutils
echo "Type a number below"

var number: int = parseInt(readLine(stdin))

if number mod 2 == 0:
  echo "This number is even"
else:
  echo "This number is odd"