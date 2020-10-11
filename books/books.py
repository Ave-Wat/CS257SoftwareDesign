# Avery Watts and Rebecca Hicke
# Revised by Avery Watts and Rebecca Hicke

from book import Book
import csv
import sys
import argparse

def readFile():
    '''
    Reads in books.csv and creates a list, library, of Book objects
    '''
    library = []
    with open("books.csv", 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            library.append(Book(row[0], row[1], row[2]))
    return library

def searchAuthors(library, searchString):
    '''
    Returns a list of books with searchString in the author's name, sorted alphabetically by author's last name
    Formatting for sorted() calls informed by https://docs.python.org/3/howto/sorting.html
    '''
    searchedBooks = []
    for book in library:
        author = book.getAuthorName().lower()
        if searchString in author:
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorNameToSortBy.split(" ")[-1].lower())

def searchTitle(library, searchString):
    '''
    Returns a list of books with searchString in the title, sorted alphabetically by title
    '''
    searchedBooks = []
    for book in library:
        if searchString.lower() in book.getTitle().lower():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.title.lower())

def searchYears(library, searchString):
    '''
    Returns a list of books with whose publication year is in the range determined by searchString, sorted chronologically by publication year
    '''
    listYears = searchString.split("-")
    searchedBooks = []

    startYear = int(listYears[0])
    endYear = int(listYears[1])

    for book in library:
        for i in range(startYear,endYear + 1):
            if int(book.getPubYear()) == i:
                searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: int(Book.pubYear))

def searchAll(library, searchString):
    '''
    Returns a list of books with searchString in any field, sorted alphabetically by author's last name
    '''
    searchedBooks = []
    for book in library:
        if searchString.lower() in book.getFullLine().lower():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorNameToSortBy.split(" ")[-1].lower())

def sortLibrary(library):
    '''
    Sorts an input library by author's last name
    '''
    library = sorted(library, key = lambda Book: Book.authorNameToSortBy.split(" ")[-1].lower())
    return library

def printBooks(bookList, mode):
    '''
    Prints a list of books, mode can be 'normal' or 'author' and when the mode is 'author' the function prints a blank line when the author of a book changes
    '''
    lastAuthor = ""
    for book in bookList:
        if mode == "author" and lastAuthor != book.getAuthorName() and lastAuthor != "":
            print()
        book.printBook()
        lastAuthor = book.getAuthorName()

def getParsedArgs():
    '''
    Parses arguments from the commandline using argparse
    '''
    parser = argparse.ArgumentParser(description="Type of print")
    parser.add_argument("print", help="print and sort decider")
    parser.add_argument("--title", nargs = '?', dest="titleSearch")
    parser.add_argument("--years", nargs = '?', dest="yearsSearch")
    parser.add_argument("--author", nargs = '?', dest="authorSearch")
    parser.add_argument("--all", nargs = '?', dest="allSearch")

    parsedArgs = parser.parse_known_args()
    return parsedArgs

def runCommands(library, parsedArgs, unknownArgs):
    '''
    Run the commands to sort and print books as specified
    '''
    if parsedArgs.print != "print":
        sys.stderr.write("Please enter a valid command. For more help, run the help commmand.\nTry running python3 books.py --help.\n")
    elif unknownArgs:
        for argument in unknownArgs:
            sys.stderr.write("You have entered an unknown command.\nTry running python3 books.py --help.\n")
    else:
        mode = "normal"
        if parsedArgs.allSearch == None and parsedArgs.yearsSearch == None and parsedArgs.authorSearch == None and parsedArgs.titleSearch == None:
            printBooks(sortLibrary(library), mode)
        else:
            if parsedArgs.allSearch != None:
                library = searchAll(library, parsedArgs.allSearch)
            if parsedArgs.yearsSearch != None:
                library = searchYears(library, parsedArgs.yearsSearch)
            if parsedArgs.authorSearch != None:
                library = searchAuthors(library, parsedArgs.authorSearch)
                mode = "author"
            if parsedArgs.titleSearch != None:
                library = searchTitle(library, parsedArgs.titleSearch)
            printBooks(library, mode)

def main():
    library = readFile()
    parsedArgs, unknownArgs = getParsedArgs()
    runCommands(library, parsedArgs, unknownArgs)

main()
