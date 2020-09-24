class Book:
    def __init__(self, title, pubYear, author):
        self.title = title
        self.pubYear = pubYear
        authorList = author.split("(")
        self.authorName = authorList[0].rstrip()
        self.authorYears = authorList[1].rstrip()
        
    def getTitle(self):
        return self.title
    
    def getPubYear(self):
        return self.pubYear
    
    def getAuthorName(self):
        return self.authorName
    
    def getAuthorYears(self):
        return self.authorYears
    
    def printBook(self):
        print(self.title, end=',')
        print(self.pubYear, end=',')
        print(self.authorName, end=' ')
        print("(" + self.authorYears + ")")
