"""
python3 -m venv 'name'-env
'name'-env\Scripts\activate.bat
pip install bs4 or sudo pip3 install bs4
pip install requests or sudo pip3 install requests
"""

from bs4 import BeautifulSoup
import requests
import csv
import tabula

headers = requests.utils.default_headers()
headers.update({
'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36",
})

def scrape2019Champ():
    '''file = "MIAC-MXC19.pdf"
    tabula.convert_into(file, "2019MIAC-temp.csv", pages = "all")'''

    athleteOutputList = []
    with open('2019MIAC-temp.csv') as file:
        csvReader = csv.reader(file, delimiter=',')
        lineCount = 0
        for row in csvReader:
            #skip rows 31 through 52 (inclusive)
            if lineCount not in range(30,52):
                event = 'MIAC Championships'
                nameList = row[1].split(",")
                name = nameList[1].strip() + " " + nameList[0].title()
                team = editTeamName(row[4])
                time = row[6]
                place = row[0]
                year = '2019'
                location = 'Carleton College, Northfield'
                athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
                print(athleteDict)
                athleteOutputList.append(athleteDict)
            lineCount = lineCount + 1
        file.close()

    writeToCSV('2019MIAC.csv', athleteOutputList)

def editTeamName(teamName):
    endIdx = teamName.find('(')
    if endIdx == -1:
        endIdx = len(teamName)
    teamName = teamName[0:endIdx].strip()
    return teamName

def scrape2018Champ(url):
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    resultsList = content.find_all('table')

    for line in resultsList[1].find_all('tr'):
            sectionList = line.find_all('td')
            if sectionList[0].getText().isnumeric() is True:
                event = 'MIAC Championships'
                name = sectionList[1].getText()
                team = editTeamName(sectionList[2].getText())
                time = sectionList[13].getText()
                place = sectionList[0].getText()
                year = '2018'
                location = 'St. Olaf'

                athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
                athleteOutputList.append(athleteDict)

    writeToCSV("2018MIAC.csv", athleteOutputList)

    return athleteOutputList

def scrape2017Champ(url):
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    resultsList = content.find_all('table')

    for line in resultsList[1].find_all('tr'):
            sectionList = line.find_all('td')
            if sectionList[0].getText().strip().isnumeric() is True:
                event = 'MIAC Championships'
                name = sectionList[3].getText().strip()
                team = editTeamName(sectionList[4].getText().strip())
                time = sectionList[5].getText().strip()
                place = sectionList[0].getText().strip()
                year = '2017'
                location = 'St. Olaf'

                athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
                athleteOutputList.append(athleteDict)

    writeToCSV("2017MIAC.csv", athleteOutputList)

    return athleteOutputList

def scrape2016Champ():
    # needs to be reordered to correct format in csv
    file = "2016_MIAC_MXC_Results.pdf"
    tabula.convert_into(file, "2016MIAC-temp.csv", pages = "all")

    athleteOutputList = []
    with open('2016MIAC-temp.csv') as file:
        csvReader = csv.reader(file, delimiter=',')
        lineCount = 0
        for row in csvReader:
            #skip rows 31 through 54 (inclusive)
            if lineCount not in range(30,54):
                event = 'MIAC Championships'
                name = row[1]
                endIdx = row[3].find('(')
                if endIdx == -1:
                    endIdx = len(row[3])
                team = row[3][0:endIdx].strip()
                time = row[5]
                place = row[0]
                year = '2016'
                location = 'Como Park Golf Course, St. Paul'
                athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
                print(athleteDict)
                athleteOutputList.append(athleteDict)
            lineCount = lineCount + 1
        file.close()

    writeToCSV('2016MIAC.csv', athleteOutputList)

def scrape2015Champ():
    '''
    file = open("2015MIAC-temp.txt", mode = 'r')
    lines = file.readlines()
    file.close()

    outList = []
    for i in range(len(lines)):
        lineList = lines[i].split(" ")
        if lineList[1].isnumeric():
            lineList.pop(1)
        lineList = lineList[:-1]
        name = lineList[1] + " " + lineList[2]
        lineList[1] = name
        lineList.pop(2)
        print(lineList)
        outList.append(lineList)
    #print(outLineList)

    with open("2015MIAC-temp.csv",'w') as file:
        writer = csv.writer(file)
        writer.writerows(outList)
        file.close()
    '''

    athleteOutputList = []
    with open('2015MIAC-temp.csv') as file:
        csvReader = csv.reader(file, delimiter=',')
        for row in csvReader:
            event = 'MIAC Championships'
            name = row[1]
            team = row[3]
            time = row[4]
            place = row[0]
            year = '2015'
            location = 'Como Park Golf Course, St. Paul'
            athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
            print(athleteDict)
            athleteOutputList.append(athleteDict)
        file.close()

    writeToCSV('2015MIAC.csv', athleteOutputList)

def scrape2014Champ():
    # need to amend data in csv
    url = "https://www.miacathletics.com/playoffs/2014-15/XC_2014/miacmencc2014.html"
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    paragraphList = content.find_all('p')

    table = paragraphList[8].getText()
    lines = table.split('\n')
    lines = lines[1:-2] # had to get rid of blank lines

    j = 0
    for line in lines:
        if j != 156 and j != 157:
            lineList = line.split("  ")
            '''place, place, name-grade, time, school'''
            while '' in lineList:
                lineList.remove('')

            for i in range(0, len(lineList)):
                lineList[i] = lineList[i].strip()
            if lineList[1].isnumeric():
                lineList.pop(1)

            nameGradeList = lineList[1].split(",")

            event = 'MIAC Championships'
            name = nameGradeList[0]
            team = lineList[3]
            time = lineList[2]
            place = lineList[0]
            year = '2014'
            location = 'Como Park Golf Course, St. Paul'

            athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
            athleteOutputList.append(athleteDict)
        if j == 156: # the website is messed up on this particular line
            list = ['Ernest Polania-Gonzalez','So','29:11.6','Carleton']
            athleteDict = {'event':'MIAC Championships', 'name':list[0], 'team':list[3], 'time':list[2], 'place':'157', 'year':'2014', 'location':'Como Golf Course, St. Paul'}
            athleteOutputList.append(athleteDict)
        j = j + 1

    writeToCSV("2014MIAC.csv", athleteOutputList)

def scrape2013Champ():
    url = "https://www.miacathletics.com/playoffs/2013-14/cross_country/miacmencc.html"
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    results = content.find('pre')

    tables = results.find('p')
    tablesTxt = tables.getText()
    linesList = tablesTxt.split("\n")

    for i in range(2, len(linesList) - 2):
        if i == 118:
            athleteDict = {'event':"MIAC Championships", 'name':'Ernest Polania-Gonzalez', 'team':'Carleton', 'time':'28:41.5', 'place':'117', 'year':'2013', 'location':'Como Park Golf Course, St. Paul'}
        elif i == 119:
            pass
        else:

            lineList = linesList[i].split("  ")
            '''place, place, name-grade, time, school'''
            while '' in lineList:
                lineList.remove('')

            for i in range(0, len(lineList)):
                lineList[i] = lineList[i].strip()
            if lineList[1].isnumeric():
                lineList.pop(1)

            nameGradeList = lineList[1].split(",")

            event = 'MIAC Championships'
            name = nameGradeList[0]
            team = lineList[3]
            time = lineList[2]
            place = lineList[0]
            year = '2013'
            location = 'Como Park Golf Course, St. Paul'

            athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
            athleteOutputList.append(athleteDict)
    writeToCSV('2013MIAC.csv', athleteOutputList)

def scrape2012Champ():
    url = "https://www.miacathletics.com/documents/2012/10/27/miacmencc.html"
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    results = content.find('pre')

    tables = results.find('p')
    tablesTxt = tables.getText()
    linesList = tablesTxt.split("\n")

    for i in range(2, len(linesList) - 2):
        lineList = linesList[i].split("  ")
        '''place, place, name-grade, time, school'''
        while '' in lineList:
            lineList.remove('')

        for i in range(0, len(lineList)):
            lineList[i] = lineList[i].strip()
        if lineList[1].isnumeric():
            lineList.pop(1)

        nameGradeList = lineList[1].split(",")

        event = 'MIAC Championships'
        name = nameGradeList[0]
        team = lineList[3]
        time = lineList[2]
        place = lineList[0]
        year = '2012'
        location = 'Como Park Golf Course, St. Paul'

        athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
        athleteOutputList.append(athleteDict)
    writeToCSV('2012MIAC.csv', athleteOutputList)

def scrape2011Champ():
    url = "https://www.miacathletics.com/sports/mxc/2011-12/championship_results"
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    results = content.find('pre')

    linesList = results.getText().split("\n")
    for i in range (97, len(linesList) - 1):
        lineList = linesList[i].split("  ")
        while '' in lineList:
            lineList.remove('')
        for i in range(0, len(lineList)):
            lineList[i] = lineList[i].strip()
        if lineList[1].isnumeric():
            lineList.pop(1)
        lineList[1] = lineList[1][4:]
        lineList[2] = lineList[2][3:]

        event = 'MIAC Championships'
        name = lineList[1]
        team = lineList[2]
        time = lineList[3]
        place = lineList[0]
        year = '2011'
        location = 'Como Park Golf Course, St. Paul'

        athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
        athleteOutputList.append(athleteDict)
    writeToCSV('2011MIAC.csv', athleteOutputList)

def scrape2010Champ():
    url = "https://www.miacathletics.com/sports/mxc/2010-11/championship_results"
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    results = content.find('pre')

    linesList = results.getText().split("\n")

    for i in range(134, len(linesList) - 1):
        if i == 309:
             athleteDict = {'event':'MIAC Championships', 'name':'Brandon RichardWebster,', 'team':'Bethel', 'time':'30:12.7', 'place':'176', 'year':'2010', 'location':'Como Park Golf Course, St. Paul'}
             athleteOutputList.append(athleteDict)
        else:
            lineList = linesList[i].split("  ")

            for j in range(0, len(lineList)):
                lineList[j] = lineList[j].strip()
            while '' in lineList:
                lineList.remove('')
            if lineList[1].isnumeric():
                lineList.pop(1)
            lineList[1] = lineList[1][:-4]

            event = 'MIAC Championships'
            name = lineList[1]
            team = lineList[3]
            print(lineList)
            time = lineList[2]
            place = lineList[0]
            year = '2010'
            location = 'Como Park Golf Course, St. Paul'

            athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
            athleteOutputList.append(athleteDict)
    writeToCSV('2010MIAC.csv', athleteOutputList)

def scrape2009Champ():
    url = "https://www.miacathletics.com/sports/mxc/2009-10/championship_results"
    athleteOutputList = []

    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    results = content.find('pre')
    linesList = results.getText().split("\n")
    for i in range(136, len(linesList) - 2):
        lineList = linesList[i].split("  ")
        for j in range(0, len(lineList)):
            lineList[j] = lineList[j].strip()
        while '' in lineList:
            lineList.remove('')
        if lineList[1].isnumeric():
            lineList.pop(1)
        lineList[1] = lineList[1][:-4]

        event = 'MIAC Championships'
        name = lineList[1]
        team = lineList[3]
        time = lineList[2]
        place = lineList[0]
        year = '2009'
        location = 'Como Park Golf Course, St. Paul'

        athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
        athleteOutputList.append(athleteDict)
    writeToCSV('2009MIAC.csv', athleteOutputList)


def writeToCSV(filename, athleteOutputList):
    keys = athleteOutputList[0].keys()
    with open(filename, "w", newline="") as file:
        writer = csv.DictWriter(file, keys)
        writer.writerows(athleteOutputList)
        file.close()

def main():
    fastFinishList = ['https://www.miacathletics.com/playoffs/2018-19/xc18/Men8kResults.htm', 'https://www.miacathletics.com/sports/mxc/2017-18/files/MIACMen.html']
    athleteList = []
    '''scrape2018Champ("https://www.miacathletics.com/playoffs/2018-19/xc18/Men8kResults.htm")
    scrape2017Champ("https://www.miacathletics.com/sports/mxc/2017-18/files/MIACMen.html")
    scrape2014Champ()
    scrape2012Champ()
    scrape2011Champ()
    scrape2010Champ()
    scrape2009Champ()
    scrape2019Champ()
    scrape2016Champ()
    scrape2015Champ()'''
main()
