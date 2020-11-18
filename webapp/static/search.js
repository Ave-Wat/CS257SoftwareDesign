import Athlete from './athlete.js';
import Team from './team.js';

function initialize() {
  var queryString = decodeURIComponent(window.location.search);
  queryString = queryString.substring(1);
  var queriesWithAssignment = queryString.split("&");
  var queryValues = [];
  for (var i = 0; i < queriesWithAssignment.length; i++) {
    var lineList = queriesWithAssignment[i].split("=");
    queryValues.push(lineList[1]);
  }

  var searchField = queryValues[0];
  var keyword = queryValues[1];

  var url = getAPIBaseURL() + '/search?field=' + searchField + '&keyword=' + keyword;
  var resultsHeaderElement = document.getElementById('results-header');
  resultsHeaderElement.innerHTML = 'Results for "' + keyword + '" by ' + searchField + ':';

  fetch(url, {method: 'get'})
  .then((response) => response.json())

  .then(function(searchResults) {
    if (searchField == 'athletes') {
      displayAthletesResults(searchResults);
    } else if (searchField == 'teams') {
      displayTeamsResults(searchResults);
    } else {
      displayYearResults(searchResults);
    }
  })


  .catch(function(error) {
      console.log(error);
  });
}

function displayAthletesResults(athletesDict) {
  var divBody = '';
  for (var name in athletesDict) {
    var athleteEntry = '<p>' + name + ', ' + athletesDict[name]['team'] + '</p>';
    var athletePerformances = athletesDict[name]['performances'];
    var yearTableRow = '';
    var placeTableRow = '';
    var timeTableRow = '';
    for (var year in athletePerformances) {
      yearTableRow += '<td>' + year + '</td>';
      placeTableRow += '<td>' + athletePerformances[year][0] + '</td>';
      timeTableRow += '<td>' + athletePerformances[year][1] + '</td>';
    }
    athleteEntry += '<table><tr><th>Year</th>' + yearTableRow;
    athleteEntry += '</tr><tr><th>Place</th>' + placeTableRow;
    athleteEntry += '</tr><tr><th>Time</th>' + timeTableRow + '</tr></table>';
    divBody = athleteEntry + divBody;
  }
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
}
  /*
  var athletes = groupAthleteResultsByAthlete(athletePerformancesList);
  var divBody = '';
  for (var i = 0; i < athletes.length; i++) {
    var athlete = athletes[i];
    divBody += '<p>' + athlete.name + ', ' + athlete.team + '</p><table>';
    divBody += '<tr><th>Year</th>';
    for (var j = 0; j < athlete.years.length; j++) {
      divBody += '<td>' + athlete.years[j] + '</td>';
    }
    divBody += '</tr><tr><th>Place</th>';
    for (var j = 0; j < athlete.places.length; j++) {
      divBody += '<td>' + athlete.places[j] + '</td>';
    }
    divBody += '</tr><tr><th>Time</th>';
    for (var j = 0; j < athlete.times.length; j++) {
      divBody += '<td>' + athlete.times[j] + '</td>';
    }
    divBody += '</tr></table>';
  }
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
}*/

function groupAthleteResultsByAthlete(athletePerformancesList) {
  var athletes = [];
  for (var i = athletePerformancesList.length - 1; i >= 0; i--) {
    var currAthletePerformance = athletePerformancesList[i];
    var currAthleteName = currAthletePerformance['name'];
    var athleteAlreadyCreated = false;
    for (var j = 0; j < athletes.length; j++) {
      if (athletes[j].name.replace(/\s+/g, '') === currAthleteName.replace(/\s+/g, '')) {
        athleteAlreadyCreated = true;
        athletes[j].addPerformance(currAthletePerformance['year'], currAthletePerformance['place'], currAthletePerformance['time']);
      }
    }
    if (!athleteAlreadyCreated) {
      var newAthlete = new Athlete(currAthleteName, currAthletePerformance['team']);
      newAthlete.addPerformance(currAthletePerformance['year'], currAthletePerformance['place'], currAthletePerformance['time']);
      athletes.push(newAthlete);
    }
  }
  return athletes;
}
function displayTeamsResults(teamsDict) {
  var divBody = '';
  for (var name in teamsDict) {
    var teamEntry = '<p>' + name + ' (' + teamsDict[name]['location'] + ')</p>';
    var teamPerformances = teamsDict[name]['performances'];
    var yearTableRow = '';
    var placeTableRow = '';
    var pointsTableRow = '';
    for (var year in teamPerformances) {
      yearTableRow += '<td>' + year + '</td>';
      placeTableRow += '<td>' + teamPerformances[year][0] + '</td>';
      pointsTableRow += '<td>' + teamPerformances[year][1] + '</td>';
    }
    teamEntry += '<table><tr><th>Year</th>' + yearTableRow;
    teamEntry += '</tr><tr><th>Place</th>' + placeTableRow;
    teamEntry += '</tr><tr><th>Points</th>' + pointsTableRow + '</tr></table>';
    divBody = teamEntry + divBody;
  }
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
}
/*
  var divBody = '';
  var teams = groupTeamResultsByTeam(teamPerformancesList);
  for (var i = 0; i < teams.length; i++) {
    var team = teams[i];
    divBody += '<div><p>' + team.name + ' (' + team.location + ')</p><table>';
    divBody += '<tr><th>Year</th>';
    for (var j = 0; j < team.years.length; j++) {
      divBody += '<td>' + team.years[j] + '</td>';
    }
    divBody += '</tr><tr><th>Place</th>';
    for (var j = 0; j < team.places.length; j++) {
      divBody += '<td>' + team.places[j] + '</td>';
    }
    divBody += '</tr><tr><th>Points</th>';
    for (var j = 0; j < team.points.length; j++) {
      divBody += '<td>' + team.points[j] + '</td>';
    }
    divBody += '</tr></table>';
  }
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
}*/

function groupTeamResultsByTeam(teamPerformancesList) {
  var teams = [];
  for (var i = teamPerformancesList.length - 1; i >= 0; i--) {
    var currTeamPerformance = teamPerformancesList[i];
    var currTeamName = currTeamPerformance['name'];
    var teamAlreadyCreated = false;
    for (var j = 0; j < teams.length; j++) {
      if (teams[j].name.replace(/\s+/g, '') === currTeamName.replace(/\s+/g, '')) {
        teamAlreadyCreated = true;
        teams[j].addPerformance(currTeamPerformance['year'], currTeamPerformance['place'], currTeamPerformance['points']);
      }
    }
    if (!teamAlreadyCreated) {
      var newTeam = new Team(currTeamName, currTeamPerformance['location']);
      newTeam.addPerformance(currTeamPerformance['year'], currTeamPerformance['place'], currTeamPerformance['points']);
      teams.push(newTeam);
    }
  }
  return teams;
}

  /*
  var teamResultsByTeam = [];
  var currTeamName = '';
  var currTeamResults = {'name':'','location':'','years':[],'places':[],'points':[]};
  for (var i=teamPerformancesList.length-1; i >= 0; i--) {
    if (teamPerformancesList[i]['name'] != currTeamName) {
      if (currTeamName != '') {
        teamResultsByTeam.push(currTeamResults);
      }
      currTeamName = teamPerformancesList[i]['name'];
      currTeamResults = {'name':'','location':'','years':[],'places':[],'points':[]};
      currTeamResults['name'] = currTeamName;
      currTeamResults['location'] = teamPerformancesList[i]['location'];
    }
    currTeamResults['years'].push(teamPerformancesList[i]['year']);
    currTeamResults['places'].push(teamPerformancesList[i]['place']);
    currTeamResults['points'].push(teamPerformancesList[i]['points']);
  }
teamResultsByTeam.push(currTeamResults);
return teamResultsByTeam;
}*/

function displayYearResults(yearResults) {
  var teamResults = yearResults[0];
  var individualResults = yearResults[1];
  var meet_location = teamResults[0]['location']
  var divBody = '<p id="location">Meet Location: ' + meet_location + '</p><p>Team Results: </p><table><tr><th>Team</th><th>Place</th><th>Points</th></tr>';
  for (var i=0; i < teamResults.length; i++) {
    divBody += '<tr>';
    for (var key in teamResults[i]) {
      if (key != 'location') {
        divBody += '<td>' + teamResults[i][key]; + '</td>';
      }
    }
    divBody += '</tr>';
  }
  divBody += '</table><p>Individual Results: </p><table><tr><th>Name</th><th>Team</th><th>Place</th><th>Time</th></tr>'
  for (var j=0; j < individualResults.length; j++) {
    divBody += '<tr>';
    for (var key in individualResults[j]) {
      divBody += '<td>' + individualResults[j][key] + '</td>';
    }
    divBody += '</tr>';
  }
  divBody += '</table>';
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
}
// Returns the base URL of the API, onto which endpoint components can be appended.
function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

window.onload = initialize;
