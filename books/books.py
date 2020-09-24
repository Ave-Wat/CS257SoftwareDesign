from book import Book
import csv
import sys

def compare(itemOne, itemTwo, sortBy):
    if sortBy == "author":
        itemOne = itemOne.getAuthorName().split(" ")[1].lower()
        itemTwo = itemTwo.getAuthorName().split(" ")[1].lower()
    elif sortBy == "year":
        itemOne = int(itemOne.getPubYear())
        itemTwo = int(itemTwo.getPubYear())
    elif sortBy == "title":
        itemOne = itemOne.getTitle().lower()
        itemTwo = itemTwo.getTitle().lower()
        
    if itemOne < itemTwo:
        return True
    return False

def sortBooks(searchedBooks, sortBy):
    if len(searchedBooks) > 1:
        leftSide = sortBooks(searchedBooks[:len(searchedBooks)//2], sortBy)
        rightSide = sortBooks(searchedBooks[len(searchedBooks)//2:], sortBy)
    
        sortedBooks = []
        while (len(leftSide) > 0 and len(rightSide) > 0):
            if (compare(leftSide[0], rightSide[0], sortBy)):
                sortedBooks.append(leftSide[0])
                leftSide.pop(0)
            else:
                sortedBooks.append(rightSide[0])
                rightSide.pop(0)
    
        if len(leftSide) != 0:
            sortedBooks += leftSide
        elif len(rightSide) != 0:
            sortedBooks += rightSide
    else:
        sortedBooks = searchedBooks
        
    return sortedBooks
    

def searchAuthors(searchString):
    withAuthor = []
    for book in library:
        author = book.getAuthorName().lower()
        if searchString in author:
            withAuthor.append(book)
    return sortBooks(withAuthor, "author")
#def determineCommands(commands):

library = []

with open("books.csv", 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    for row in csvreader:
        library.append(Book(row[0], row[1], row[2]))

sorted = searchAuthors("an")
for book in sorted:
    book.printBook()
#determineCommands(sys.argv)

