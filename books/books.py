from book import Book
import csv
import sys

#def determineCommands(commands):

library = []

with open("books.csv", 'r') as csvfile:
    csvreader = csv.reader(csvfile)
    for row in csvreader:
        library.append(new Book(row[0], row[1], row[2]))
print(library)

#determineCommands(sys.argv)
    
