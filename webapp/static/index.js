/*
  index.js
  3 November 2020
 */

function onSearchButton(){
  searchField = "";
  var searchBar = document.getElementById('champ-search');
  var keyword = searchBar.value;
  var radioButtons = document.getElementsByName('search-field');
  for(i = 0; i < radioButtons.length; i++) {
    if(radioButtons[i].checked){
      searchField = radioButtons[i].value;
    }
  }

  var queryString = "?field=" + searchField + "&keyword=" + keyword;
  window.location.href = "search.html" + queryString;
}

function collapsibles(){
  var collapsibles = document.getElementsByClassName("collapsible");
  var i;

  for (i = 0; i < collapsibles.length; i++) {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  }
}

function teamPerformanceAnalysis(){
  var checkBoxDiv = document.getElementById('team-performance-checkboxes');
  var checkBoxValues = [];
  for (var i = 0; i < checkBoxDiv.children.length; i++ ) {
    if (checkBoxDiv.children[i].type == 'checkbox'){
      if(checkBoxDiv.children[i].checked){
        checkBoxValues.push(checkBoxDiv.children[i].value);
      }
    }
  }

  var checkBoxValuesString = checkBoxValues.join();
  var url = getAPIBaseURL() + '/teams_performances?teams=' + checkBoxValuesString;

  fetch(url, {method: 'get'})

  .then((response) => response.json())

  .then(function(teamsPerformancesDict) {
    //{team1: [list of places from 2009 to 2019], team2: [(same)]}
    var divBody = '<table>';
    for (var key in teamsPerformancesDict) {
      divBody += '<tr>';
      divBody += '<td>' + key + '</td>';
      for (var i = 0; i < teamsPerformancesDict[key].length; i ++) {
        divBody += '<td>' + teamsPerformancesDict[key][i] + '</td>';
      }
      divBody += '</tr>';
    }
    divBody += '</table>';
    var resultsDivElement = document.getElementById('teams-performances-content-div');
    resultsDivElement.innerHTML = divBody;
  })

  .catch(function(error) {
    console.log(error);
  });
}

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

  var teamPerformanceAnalysisButton = document.getElementById("input-team-performances");
  teamPerformanceAnalysisButton.onclick = teamPerformanceAnalysis;
}

window.onload = initialize;
