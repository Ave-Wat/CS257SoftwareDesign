# Avery Watts and Rebecca Hicke
class Book:
    '''
    this class represents books from the .csv file. Each Book has a title, a year of publication, an author name, and years denoting the author's life.
    '''
    def __init__(self, title, pubYear, author):
        self.title = title
        self.pubYear = pubYear
        if "and" in author:
            authorList = author.split("and")
            authorList[0] = authorList[0].split("(")
            authorList[1] = authorList[1].split("(")
            self.authorName = authorList[0][0].rstrip() + "" + authorList[1][0].rstrip()
            self.authorYears = authorList[0][1].rstrip() + "" + authorList[1][1].rstrip()
            self.authorNameToSortBy = authorList[0][0].rstrip()
        else:
            authorList = author.split("(")
            self.authorName = authorList[0].rstrip()
            self.authorYears = authorList[1].rstrip()
            self.authorNameToSortBy = authorList[0].rstrip()

        #these are extra variables for printing formatting
        self.authorFull = author
        self.fullLine = title + pubYear + author

    def getTitle(self):
        return self.title

    def getPubYear(self):
        return self.pubYear

    def getAuthorName(self):
        return self.authorName

    def getAuthorYears(self):
        return self.authorYears

    def getAuthorNameToSortBy(self):
        return self.authorNameToSortBy

    def getFullLine(self):
        return self.fullLine

    def printBook(self):
        print(self.title + ", " + self.pubYear + ", " + self.authorFull)
