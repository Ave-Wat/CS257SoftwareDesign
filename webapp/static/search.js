
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
    if (searchResults === {}) {
      alert('no results');
      return;
    }
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
  resultsDivElement.innerHTML = parseEmptySearchResults(divBody);
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
  resultsDivElement.innerHTML = parseEmptySearchResults(divBody);
}

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
  resultsDivElement.innerHTML = parseEmptySearchResults(divBody);
}

//provides a feedback string when no search results are found
function parseEmptySearchResults(resultsString) {
  if (resultsString === '') {
    return 'No Results Found.';
  } else {
    return resultsString;
  }
}

// Returns the base URL of the API, onto which endpoint components can be appended.
function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

window.onload = initialize;
