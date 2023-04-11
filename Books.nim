#Compile instructions
#[nim compile --run Books.nim
  shortened compile command
  nim c -r Books.nim
]#
type
  Book = object
    title, genre, author: string
    pageNum: int

var book1 = Book(title: "Cinder", genre: "sci-fi", author: "Myers", pageNum: 350)
var book2 = Book(title: "Michael Vey", genre: "sci-fi", author: "Evans", pageNum: 235)
var book3 = Book(title: "Harry Potter", genre: "fantasy", author: "Rowling", pageNum: 217)
var book4 = Book(title: "Six of Crows", genre: "mystery", author: "Bardugo", pageNum: 421)


var library: seq[Book]

library.add(book1)
library.add(book2)
library.add(book3)
library.add(book4)


echo "My library:"

for i in low(library)..high(library):
  echo library[i].title, " - by ", library[i].author

echo ""

echo "Pages read:"
var pages: int = 0
for i in low(library)..high(library):
  pages = pages + library[i].pageNum
echo pages

echo ""

#echo "Genre's in library:"
var favGen: seq[string]
favGen.add(library[0].genre)
for i in (low(library)+1)..high(library):
  if library[i-1].genre != library[i].genre:
    favGen.add(library[i].genre)

for i in low(favGen)..high(favGen):
  echo favGen[i]