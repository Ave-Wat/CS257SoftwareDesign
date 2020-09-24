from book import Book
import csv
import sys

library = []

# Reads in books.csv and creates a list, library, of Book objects
def readFile():
    with open("books.csv", 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            library.append(Book(row[0], row[1], row[2]))

# Returns a list of books with searchString in the author's name, sorted alphabetically by author's last name
# Formatting for sorted() calls informed by https://docs.python.org/3/howto/sorting.html
def searchAuthors(searchString):
    searchedBooks = []
    for book in library:
        author = book.getAuthorName().lower()
        if searchString in author:
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorName.split(" ")[1].lower())

#Returns a list of books with searchString in the title, sorted alphabetically by title
def searchTitle(searchString):
    searchedBooks = []
    for book in library:
        if searchString in book.getTitle().lower():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.title.lower())

#Returns a list of books with whose publication year is in the range determined by searchString, sorted chronologically by publication year
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

# Returns a list of books with searchString in any field, sorted alphabetically by author's last name
def searchAll(searchString):
    searchedBooks = []
    for book in library:
        if searchString.lower() in book.getFullLine().lower():
            searchedBooks.append(book)
    return sorted(searchedBooks, key = lambda Book: Book.authorName.split(" ")[1].lower())

# Prints the usage.txt file
def helpCmnd():
    with open('usage.txt') as usage:
        usage = usage.readlines()
        for line in usage:
            print(line, end="")
    print()
    
# Prints a list of books, mode can be 'normal' or 'author' and when the mode is 'author' the function prints a blank line when the author of a book changes
def printBooks(bookList, mode):
    lastAuthor = ""
    for book in bookList:
        if mode == "author" and lastAuthor != book.getAuthorName():
            print()
        book.printBook()
        lastAuthor = book.getAuthorName()
        
# Determines what functions to run based on command line arguments
def determineCommands():
    #program name is sys.argv[0]
    
    length = len(sys.argv)
    
    if length < 2:
        sys.stderr.write("Please type a command. For more help, run the help commmand.\nTry running python3 books.py help.\n")
        
    elif sys.argv[1] == "print":
        
        if length == 2:
            printBooks(library, "normal")
        
        elif length == 3:
            printBooks(searchAll(sys.argv[2]), "normal")
            #could run into problems with books.py cmnd option since this also triggers it
        elif length > 3:
            numCommands = (length-2)//2
            sorted_books = []
            mode = ""
            worked = False
            for i in range(numCommands):
                option = sys.argv[i*2+2]
                if option == "--title":
                    sorted_books = searchTitle(sys.argv[i*2+3])
                    library = sorted_books
                    mode = "normal"
                    worked = True
                elif option == "--years":
                    sorted_books = searchYears(sys.argv[i*2+3])
                    library = sorted_books
                    mode = "normal"
                    worked = True
                elif option == "--author":
                    sorted_books = searchAuthors(sys.argv[i*2+3])
                    library = sorted_books
                    mode = "author"
                    worked = True
                else:
                    sys.stderr.write("You need to type a valid option.\nTry running python3 books.py help.\n")
                if worked:
                    printBooks(sorted_books, mode)
        else:
            sys.stderr.write("You have typed too many command and option entries.\nTry running python3 books.py help.\n")
    elif sys.argv[1] == "help":
        helpCmnd()
    else:
        sys.stderr.write("Please type a valid command. For more help, run the help commmand.\nTry running python3 books.py help.\n")

def main():
    readFile()
    determineCommands()

main()
