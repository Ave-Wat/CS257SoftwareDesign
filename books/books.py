from book import Book
import csv
import sys

#def determineCommands(commands):

library = []

with open("books.csv", 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    for row in csvreader:
        library.append(Book(row[0], row[1], row[2]))
print(library)
    
def searchTitle(searchString):
    searchedBooks = []
    for book in library:
        if searchString in book.getTitle():
            searchedBooks.append(book)
    return searchedBooks

def searchYears(searchKey):
    searchedBooks = []
    for book in library:
        if book.getPubYear() == searchKey:
            searchedBooks.append(book)
    return searchedBooks

def searchAll(searchString):
    searchedBooks = []
    for book in library:
        if searchString in book.getFullLine():
            searchedBooks.append(book)
    return searchedBooks
    
def printBooks(bookList):
    for book in bookList:
        book.printBook()
        

def determineCommands():
    #program name is sys.argv[0]
    if sys.argv[1] == "print":
        option = sys.arv[2]
        if option == "--title":
            searchBooks()
    else if sys.arv[1] == "help":
        #print usage.txt file
    else:
        #print error message
    
    
    
