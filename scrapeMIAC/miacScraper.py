"""
python3 -m venv 'name'-env
'name'-env\Scripts\activate.bat
pip install bs4 or sudo pip3 install bs4
pip install requests or sudo pip3 install requests
"""

from bs4 import BeautifulSoup
import requests
import csv

def scrape2018Champ(url):
    athleteOutputList = []
    headers = requests.utils.default_headers()
    headers.update({
    'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36",
    })
    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    resultsList = content.find_all('table')

    for line in resultsList[1].find_all('tr'):
            sectionList = line.find_all('td')
            if sectionList[0].getText().isnumeric() is True:
                event = 'MIAC Championships'
                name = sectionList[1].getText()
                team = sectionList[2].getText()
                time = sectionList[13].getText()
                place = sectionList[0].getText()
                year = '2018'
                location = 'St. Olaf'

                athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
                athleteOutputList.append(athleteDict)
    return athleteOutputList

def scrape2017Champ(url):
    print("run")
    athleteOutputList = []
    headers = requests.utils.default_headers()
    headers.update({
    'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36",
    })
    response = requests.get(url, headers = headers)
    content = BeautifulSoup(response.content, "html.parser")

    resultsList = content.find_all('table')

    for line in resultsList[1].find_all('tr'):
            sectionList = line.find_all('td')
            if sectionList[0].getText().strip().isnumeric() is True:
                event = 'MIAC Championships'
                name = sectionList[3].getText().strip()
                team = sectionList[4].getText().strip()
                time = sectionList[5].getText().strip()
                place = sectionList[0].getText().strip()
                year = '2017'
                location = 'St. Olaf'

                athleteDict = {'event':event, 'name':name, 'team':team, 'time':time, 'place':place, 'year':year, 'location':location}
                athleteOutputList.append(athleteDict)
    return athleteOutputList

def main():
    fastFinishList = ['https://www.miacathletics.com/playoffs/2018-19/xc18/Men8kResults.htm', 'https://www.miacathletics.com/sports/mxc/2017-18/files/MIACMen.html']
    athleteList = []
    athleteList = athleteList + (scrape2018Champ("https://www.miacathletics.com/playoffs/2018-19/xc18/Men8kResults.htm"))
    athleteList = athleteList + (scrape2017Champ("https://www.miacathletics.com/sports/mxc/2017-18/files/MIACMen.html"))
    print(athleteList)

main()
