from book import Book
import csv
import sys

library = []

def readFile():
    with open("books.csv", 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            library.append(Book(row[0], row[1], row[2]))

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
    
    startYear = int(listYears[0])
    endYear = int(listYears[1])
    
    for book in library:
        for i in range(startYear,endYear + 1):
            if int(book.getPubYear()) == i:
                searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: int(Book.pubYear))

def searchAll(searchString):
    searchedBooks = []
    for book in library:
        if searchString in book.getFullLine():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorName.split(" ")[1].lower())

def help():
    with open('usage.txt') as usage:
        usage = usage.readlines()
        for line in usage:
            print(line, end="")
    print()
    
def printBooks(bookList):
    for book in bookList:
        book.printBook()
        
#TODO finish
def determineCommands():
    #program name is sys.argv[0]
    
    length = len(sys.argv)
    
    if length < 2:
        pass
        #print error and suggest help
    elif sys.argv[1] == "print":
        option = sys.argv[2]
        
        if length < 3:
            searchAll(option)
        else:
            if length == 3:
                if option == "--title":
                    searchTitle(sys.argv[3])
                elif option == "--years":
                    searchYears(sys.argv[3])
                elif option == "--author":
                    searchAuthors(sys.argv[3])
            else:
                pass
                #print error: too many cmnd line entries
    elif sys.arv[1] == "help":
        pass
        #print usage.txt file
    else:
        pass
        #print error message and suggest help

    if sys.argv[1] == "print":
        option = sys.arv[2]
        if option == "--title":
            searchBooks()
    elif sys.arv[1] == "help":
        pass
        #print usage.txt file
    else:
        pass
        #print error message
    

def main():
    readFile()
    #determineCommands()

main()
