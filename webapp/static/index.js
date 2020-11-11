/*
  index.js
  3 November 2020
 */
function collapsibles(){
  var coll = document.getElementsByClassName("collapsible");
  var i;

  for (i = 0; i < coll.length; i++) {
      this.classList.toggle("active");
      var content = this.nextElementSibling;
      if (content.style.display === "block") {
        content.style.display = "none";
      } else {
        content.style.display = "block";
      }
  }
}

function onSearchButton(){
  location.href = "/search.html";
  var searchBar = document.getElementById('champ-search');
  var keyword = searchBar.value;
  var radioButtons = document.getElementsByName('search-field');
  for(i = 0; i < radioButtons.length; i++) {
    if(radioButtons[i].checked)
      searchField = radioButtons[i].value;
    }
  }

  var resultsHeaderElement = document.getElementById('results-header');
  resultsHeaderElement.innerHTML = 'Results for' + keyword + 'in' + searchField;

  var url = getAPIBaseURL() + '/search?field=[' + searchField + ']&keyword={' + keyword + '}';
  fetch(url, method: 'get')

  .then((response) => response.json())

  if searchField == 'athletes' {
    .then(displayAthletesResults(athletesList))
  } else if searchField == 'teams' {
    .then(displayTeamsResults(teamsList))
  } else {
    .then(displayYearResults(yearResults))
  }
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
    divBody += '</tr>'';
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

function initialize() {
  var searchButton = document.getElementById("input-search");
  searchButton.onclick = onSearchButton;

  var teamPerformanceButton = document.getElementById("team-performance");
  var teamDepthButton = document.getElementById("team-depth");
  var athleteDevButton = document.getElementById("athlete-dev");
  teamPerformanceButton.onclick = collapsibles;
  teamDepthButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;
}

window.onload = initialize;
