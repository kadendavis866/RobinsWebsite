#Compile instructions
#[nim compile --run PriceIsRight.nim
  shortened compile command
  nim c -r PriceIsRight.nim
]#
import strutils
echo "Welcome to the Price is Right!"
echo "Guess the price of a Lazy Boy recliner"

var bids: array[0..3, int]

for i in 0 .. 3:
  bids[i] = parseInt(readLine(stdin))

proc priceIsRight(x: varargs[int], tar: int): int =
  var win: int
  for i in low(x) .. high(x):
    if x[i] <= tar :
      win = x[i]
  return win

var win = priceIsRight(bids, 449)

if win == 0:
  echo "All guesses went over, try again."
else:
  echo "The contestant with the bid of ", win, " got the closest to 449!"