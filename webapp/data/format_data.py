import csv

individual_performances_temp = []
athletes = []
teams = [[]]
meets = []
team_performances_temp = []
athlete_team_link = []
individual_performances = []
team_performances = []

def read_MIAC_performances():
    for i in range(2009, 2020):
        with open(str(i) + 'MIAC.csv') as file:
            csvReader = csv.reader(file, delimiter=',')
            for row in csvReader:
                individual_performance = row
                individual_performances_temp.append(individual_performance)
        file.close()
    #print(individual_performances_temp)

def write_to_csv(filename, list):
    with open(filename,'w') as file:
        writer = csv.writer(file)
        writer.writerows(list)
        file.close()

def create_athlete_list():
    id = 1
    for performance in individual_performances_temp:
        athlete_name = performance[1]
        athlete_in_list = False
        for athlete_list in athletes:
            if athlete_list[1] == athlete_name:
                athlete_in_list = True
        if athlete_in_list == False:
            athletes.append([id, athlete_name])
            id = id + 1
    #print(athletes)

def create_team_list():
    team_list = [[1, "Carleton", "Northfield, MN"],
    [2, "St. Thomas", "St. Paul, MN"],
    [3, "St. Olaf", "Northfield, MN"],
    [4, "Gustavus Adolphus", "St. Peter, MN"],
    [5, "Hamline", "St. Paul, MN"],
    [6, "Saint John's", "St. Joseph, MN"],
    [7, "Bethel", "St. Paul, MN"],
    [8, "Concordia-Moorhead", "Moorhead, MN"],
    [9, "Macalester", "St. Paul, MN"],
    [10, "Augsburg", "Minneapolis, MN"],
    [11, "Saint Mary's", "Winona, MN"]]
    return team_list

def create_meet_list():
    id = 1
    for i in range(2009,2020):
        location = ""
        if i < 2017:
            location = "Como Park Golf Course, St. Paul"
        elif i == 2017 or i == 2018:
            location = "St. Olaf College, Northfield"
        else:
            location = "Carleton College, Northfield"

        meets.append([id, "MIAC Championships", str(i), location])
        id = id + 1
    #print(meets)

def create_team_performances_list():
    with open("team_performances-temp.csv") as file:
        csvReader = csv.reader(file, delimiter=',')
        for row in csvReader:
            team_performance = row
            team_performances_temp.append(team_performance)
    file.close()

def put_ids_in_indiv_performances(teams_list):
    #id SERIAL,ath_id INTEGER,meet_id INTEGER,team_id INTEGER,place INTEGER,time TEXT
    #original: event, name, team, time, place, year, location
    id = 1
    for performance in individual_performances_temp:
        ath_id = -1
        for ath_list in athletes:
            if ath_list[1] == performance[1]:
                ath_id = ath_list[0]
                break
        meet_id = -1
        for meet in meets:
            if performance[5] == meet[2]:
                meet_id = meet[0]
                break
        team_id = -1
        for team in teams_list:
            if performance[2] == team[1]:
                team_id = team[0]
                break
        text_time = performance[3]
        time_in_seconds = -1
        if text_time == "DNF":
            time_in_seconds = None
        else:
            time_split = text_time.split(":")
            time_in_seconds = (float(time_split[0]) * 60) + float(time_split[1])
        place = performance[4]
        revised_performance = [id, ath_id, meet_id,team_id,place,time_in_seconds]
        id = id + 1
        individual_performances.append(revised_performance)
    #print(individual_performances)

def put_ids_in_team_performances(teams_list):
    id = 1
    for performance in team_performances_temp:
        #id SERIAL,place INTEGER,points INTEGER,team_id INTEGER,meet_id INTEGER
        #year,team,points,place
        team_id = -1
        for team in teams_list:
            if team[1] == performance[1]:
                team_id = team[0]
                break
        if team_id == -1:
            print(performance)
        meet_id = -1
        for meet in meets:
            if meet[2] == performance[0]:
                meet_id = meet[0]
                break

        place = performance[3]
        points = performance[2]
        revised_performance = [id, place, points, team_id, meet_id]
        id = id + 1
        team_performances.append(revised_performance)
    #print(team_performances)


def create_links():
    #loop thru athlete ids, search indiv perf for team id to link it to
    for athlete_list in athletes:
        ath_id = athlete_list[0]
        team_id = -1
        for performance in individual_performances:
            if ath_id == performance[1]:
                team_id = performance[3]
                break
        athlete_team_link.append([ath_id,team_id])
    print(athlete_team_link)


def main():
    read_MIAC_performances()
    create_athlete_list()
    teams = create_team_list()
    create_meet_list()
    create_team_performances_list()
    put_ids_in_indiv_performances(teams)
    put_ids_in_team_performances(teams)
    create_links()
    write_to_csv("athletes_table", athletes)
    write_to_csv("individual_performances_table", individual_performances)
    write_to_csv("teams_table", teams)
    write_to_csv("meets_table", meets)
    write_to_csv("team_performances_table", team_performances)
    write_to_csv("athlete_team_link_table", athlete_team_link)

main()
