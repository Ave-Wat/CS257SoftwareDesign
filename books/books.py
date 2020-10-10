# Avery Watts and Rebecca Hicke
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

def helpCommand():
    '''
    Prints the usage.txt file
    '''
    with open('usage.txt') as usage:
        usage = usage.readlines()
        for line in usage:
            print(line, end="")
    print()

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

def runCommands(library):
    '''
    Determines what functions to run based on command line arguments
    '''
    length = len(sys.argv)

    if length < 2:
        sys.stderr.write("Please type a command. For more help, run the help commmand.\nTry running python3 books.py help.\n")

    elif sys.argv[1] == "print":

        if length == 2:
            library = sorted(library, key = lambda Book: Book.authorNameToSortBy.split(" ")[-1].lower())
            printBooks(library, "normal")

        elif length == 3:
            printBooks(searchAll(library, sys.argv[2]), "normal")

        elif length > 3:
            numCommands = (length-2)//2
            sortedBooks = []
            mode = ""
            worked = False
            for i in range(numCommands):
                option = sys.argv[i*2+2]
                if option == "--title":
                    sortedBooks = searchTitle(library, sys.argv[i*2+3])
                    library = sortedBooks
                    mode = "normal"
                    worked = True
                elif option == "--years":
                    sortedBooks = searchYears(library, sys.argv[i*2+3])
                    library = sortedBooks
                    mode = "normal"
                    worked = True
                elif option == "--author":
                    sortedBooks = searchAuthors(library, sys.argv[i*2+3])
                    library = sortedBooks
                    mode = "author"
                    worked = True
                else:
                    sys.stderr.write("You need to type a valid option.\nTry running python3 books.py help.\n")
            if worked:
                printBooks(sortedBooks, mode)
        else:
            sys.stderr.write("You have typed too many command and option entries.\nTry running python3 books.py help.\n")
    elif sys.argv[1] == "help":
        helpCommand()
    else:
        sys.stderr.write("Please type a valid command. For more help, run the help commmand.\nTry running python3 books.py help.\n")

def getParsedArgs():
    parser = argparse.ArgumentParser(description="Type of print")
    parser.add_argument("print", help="print and sort decider")
    parser.add_argument('searchString', nargs='*', default = "")
    
    subparsers = parser.add_subparsers()
    titleParser = subparsers.add_parser("--title")
    titleParser.add_argument("--title", nargs = '+', dest="titleSearch")
    yearParser = subparsers.add_parser("--years")
    yearParser.add_argument("--years", nargs = '+', dest="yearsSearch")
    authorParser = subparsers.add_parser("--author")
    authorParser.add_argument("--author", nargs = '+', dest="authorSearch")
    
    parser.add_argument('searchString1', nargs='*')
    parser.add_argument('searchString2', nargs='*')
    parser.add_argument('searchString3', nargs='*')
    
    parsedArguments = parser.parse_known_args()
    return parsedArguments
    

def runCommands():
    pass
    
def main():
    library = readFile()
    print(getParsedArgs())
    #runCommands(library)

main()
