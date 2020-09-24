class Book:
    def __init__(title, pubYear, author):
        self.title = title
        self.pubYear = pubYear
        authorList = author.split("(")
        self.authorName = authorList[0].rstrip()
        self.authorYears = authorList[1].rstrip()
        
    def getTitle():
        return self.title
    
    def getPubYear():
        return self.pubYear
    
    def getAuthorName():
        return self.authorName
    
    def getAuthorYears():
        return self.authorYears