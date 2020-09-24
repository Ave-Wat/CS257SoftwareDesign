from book import Book
import csv
import sys

library = []

def readFile():
    with open("books.csv", 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            library.append(Book(row[0], row[1], row[2]))

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
    searchedBooks = []
    for book in library:
        author = book.getAuthorName().lower()
        if searchString in author:
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorName.split(" ")[1].lower())

#TODO add sort to searchTitle,searchYears,searchAll
def searchTitle(searchString):
    searchedBooks = []
    for book in library:
        if searchString in book.getTitle().lower():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.title.lower())

def searchYears(searchString):
    listYears = searchString.split("-")
    searchedBooks = []
    
    startYear = listYears[0]
    endYear = listYears[1]
    
    for book in library:
        for i in range(startYear,endYear + 1)
            if book.getPubYear() == i:
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: int(Book.pubYear))

def searchAll(searchString):
    searchedBooks = []
    for book in library:
        if searchString in book.getFullLine():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorName.split(" ")[1].lower())
    
def printBooks(bookList):
    for book in bookList:
        book.printBook()
        
#TODO finish
def determineCommands():
    #program name is sys.argv[0]
    
    length = len(sys.argv)
    
    if length < 2:
        #print error and suggest help
        sys.stderr.write("Please type a command. For more help, run the help commmand.\nTry running python3 books.py help.\n")
        
    else if sys.argv[1] == "print":
        
        if length == 2:
            printBooks()
        
        else if length == 3:
            searchAll(sys.argv[2])
        else if length == 4:
            option = sys.argv[2]
                if option == "--title":
                    searchTitle(sys.argv[3])
                else if option == "--years":
                    searchYears(sys.argv[3])
                else if option == "--author":
                    searchAuthors(sys.argv[3])
                else:
                    #pls type valid option
            else:
                sys.stderr.write("You have typed too many command and option entries")
    else if sys.arv[1] == "help":
        #print usage.txt file
    else:
        sys.stderr.write("Please type a valid command. For more help, run the help commmand.\nTry running python3 books.py help.\n")

    
#TODO add help method

#def main():
    #readFile()
    #determineCommands()

readFile()
sorted_books = searchTitle("an")
for book in sorted_books:
    book.printBook()

