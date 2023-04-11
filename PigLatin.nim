#Compile instructions
#[nim compile --run PigLatin.nim
  shortened compile command
  nim c -r PigLatin.nim
]#
echo "Type any word you would like translated into Pig Latin"

var word = readLine(stdin)

echo word[1..^1], word[0], "a"