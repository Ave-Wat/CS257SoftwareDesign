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

  .then(function(list) {
    if (searchField == 'athletes') {
      displayAthletesResults(list);
    } else if (searchField == 'teams') {
      displayTeamsResults(list);
    } else {
      displayYearResults(list);
    }
  })


  .catch(function(error) {
      console.log(error);
  });
}

function displayAthletesResults(athletesList) {

  var divBody = '<table>';
  for (var i=0; i < athletesList.length; i++) {
    divBody += '<tr>';
    for (var key in athletesList[i]) {
      divBody += '<td>' + athletesList[i][key] + '</td>';
    }
    divBody += '</tr>';
  }
  divBody += '</table>';
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
}

function displayTeamsResults(teamsList) {
  var divBody = '<table>';
  for (var i=0; i < teamsList.length; i++) {
    divBody += '<tr>';
    for (var key in teamsList[i]) {
      divBody += '<td>' + teamsList[i][key] + '</td>';
    }
    divBody += '</tr>';
  }
  divBody += '</table>';
  var resultsDivElement = document.getElementById('search-results');
  resultsDivElement.innerHTML = divBody;
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
  resultsDivElement.innerHTML = divBody;
}
// Returns the base URL of the API, onto which endpoint components can be appended.
function getAPIBaseURL() {
    var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
    return baseURL;
}

window.onload = initialize;
