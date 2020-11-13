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
  resultsHeaderElement.innerHTML = 'Results for ' + keyword + ' by ' + searchField + ":";

  //js throws an error on this line
  //url = "http://localhost:5000/api/search?field=year&keyword=2019"
  //Failed to load resource: the server responded with a status of 500 (INTERNAL SERVER ERROR)
  //UnboundLocalError: local variable 'cursor' referenced before assignment
  //line 57 in get_cursor
  //I never opened the database...

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

//athletesList: [name, team, place, time, year]
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
//teamsList: [name, location, place, points, year]
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
//two lists: [[name, place, points, location],[name, team, place, time]]
function displayYearResults(yearResults) {
  var divBody = '<p>Team Results: </p><table>';
  var teamResults = yearResults[0];
  var individualResults = yearResults[1];
  for (var i=0; i < teamResults; i++) {
    divBody += '<tr>';
    for (var key in teamResults[i]) {
      divBody += '<td>' + teamResults[i][key]; + '</td>';
    }
    divBody += '</tr>';
  }
  divBody += '</table><p>Individual Results: </p><table>'
  for (var j=0; j < individualResults; j++) {
    divBody += '<tr>';
    for (var key in individualResults[i]) {
      divBody += '<td>' + individualResults[i][key] + '</td>';
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
