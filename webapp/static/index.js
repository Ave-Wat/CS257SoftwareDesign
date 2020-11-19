/*
  index.js
  3 November 2020
 */

function onSearchButton(){
  var searchBar = document.getElementById('champ-search');
  var keyword = searchBar.value;
  var fieldSelect = document.getElementById('search-field-select');
  var searchField = fieldSelect.value;
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
    var teamPerformancesChartData = {};
    var labels = ['2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'];
    var teamPerformancesChartSeries = [];
    var options = {};

    var divBody = '<table>';
    for (var team in teamsPerformancesDict) {
      divBody += '<tr>';
      divBody += '<td>' + team + '</td>';
      var dataDict = {data: teamsPerformancesDict[team]};
      teamPerformancesChartSeries.push(dataDict);
      for (var i = 0; i < teamsPerformancesDict[team].length; i ++) {
        divBody += '<td>' + teamsPerformancesDict[team][i] + '</td>';
      }
      divBody += '</tr>';
    }
    divBody += '</table>';

    teamPerformancesChartData = {labels: labels, series: teamPerformancesChartSeries};
    /* Initialize the chart with the above settings */
    new Chartist.Line('#teams-performances-chart', teamPerformancesChartData, options);

    var resultsDivElement = document.getElementById('teams-performances-content-div');
    resultsDivElement.innerHTML = divBody;
  })

  .catch(function(error) {
    console.log(error);
  });
}

function teamDepthAnalysis(){
  var checkBoxDivYears = document.getElementById('team-depth-year-checkboxes');
  var checkBoxYearsValues = [];
  for (var i = 0; i < checkBoxDivYears.children.length; i++ ) {
    if (checkBoxDivYears.children[i].type == 'checkbox'){
      if(checkBoxDivYears.children[i].checked){
        checkBoxYearsValues.push(checkBoxDivYears.children[i].value);
      }
    }
  }

  var checkBoxDivTeams = document.getElementById('team-depth-team-checkboxes');
  var checkBoxTeamsValues = [];
  for (var i = 0; i < checkBoxDivTeams.children.length; i++ ) {
    if (checkBoxDivTeams.children[i].type == 'checkbox'){
      if(checkBoxDivTeams.children[i].checked){
        checkBoxTeamsValues.push(checkBoxDivTeams.children[i].value);
      }
    }
  }

  var checkBoxYearsValuesString = checkBoxYearsValues.join();
  var checkBoxTeamsValuesString = checkBoxTeamsValues.join();
  var url = getAPIBaseURL() + '/team_depth?teams=' + checkBoxTeamsValuesString + '&years='+ checkBoxYearsValuesString;

  fetch(url, {method: 'get'})
  .then((response) => response.json())
  .then(function(teamDepthByYearDict) {
    //{"2019":{team1:[list of 7 times], team2:[list of 7 times], etc for each selected team}, "2018":{(as before)}, etc for each selected year}
    var divBody = '<table>';
    for (var yearKey in teamDepthByYearDict) {
      for (var teamKey in teamDepthByYearDict[yearKey]) {
        divBody += '<tr>';
        divBody += '<td>' + teamKey + '</td>';
        divBody += '<td>' + yearKey + '</td>';
        for (var i = 0; i < teamDepthByYearDict[yearKey][teamKey].length; i ++){
          divBody += '<td>' + teamDepthByYearDict[yearKey][teamKey][i] + '</td>';
        }
        divBody += '</tr>';
      }
    }
    divBody += '</table>';
    var resultsDivElement = document.getElementById('teams-depth-content-div');
    resultsDivElement.innerHTML = divBody;
  })

  .catch(function(error) {
    console.log(error);
  });
}

function athleteDevelopmentAnalysis (){
  var metric = ""
  var radioButtons = document.getElementsByName('data-form');
  for(i = 0; i < radioButtons.length; i++) {
    if(radioButtons[i].checked){
      metric = radioButtons[i].value;
    }
  }

  var checkBoxDiv = document.getElementById('athlete-dev-checkboxes');
  var checkBoxValues = [];
  for (var i = 0; i < checkBoxDiv.children.length; i++ ) {
    if (checkBoxDiv.children[i].type == 'checkbox'){
      if(checkBoxDiv.children[i].checked){
        checkBoxValues.push(checkBoxDiv.children[i].value);
      }
    }
  }

  var checkBoxValuesString = checkBoxValues.join();
  var url = getAPIBaseURL() + '/athlete_development?calculate_by=' + metric + '&teams=' + checkBoxValuesString;

  fetch(url, {method: 'get'})
  .then((response) => response.json())
  .then(function(athletePerformances) {
    //{team1:{athlete_name: [[time, year], etc for multiple years], etc for multiple athletes} team2:{}}
    var divBody = '';
    for (var teamKey in athletePerformances) {
      divBody += '<table>';
      divBody += '<tr>' + teamKey + '</tr>';
      for (var athleteKey in athletePerformances[teamKey]) {
        divBody += '<tr>';
        divBody += '<td>' + athleteKey + '</td>';
        for (var i = 0; i < athletePerformances[teamKey][athleteKey].length; i ++){
          divBody += '<td>' + athletePerformances[teamKey][athleteKey][i] + '</td>';
        }
        divBody += '</tr>';
      }
      divBody += '</table>';
    }

    var resultsDivElement = document.getElementById('athlete-dev-content-div');
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
  document.getElementById("champ-search")
    .addEventListener("keyup", function(event) {
      event.preventDefault();
      if (event.keyCode === 13) {
        searchButton.click();
      }
  });
  searchButton.onclick = onSearchButton;

  var teamPerformanceButton = document.getElementById("team-performance");
  var teamDepthButton = document.getElementById("team-depth");
  var athleteDevButton = document.getElementById("athlete-dev");
  teamPerformanceButton.onclick = collapsibles;
  teamDepthButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;

  var teamPerformanceAnalysisButton = document.getElementById("input-team-performances");
  teamPerformanceAnalysisButton.onclick = teamPerformanceAnalysis;
  var teamDepthAnalysisButton = document.getElementById('input-team-depth');
  teamDepthAnalysisButton.onclick = teamDepthAnalysis;
  var athleteDevButton = document.getElementById('input-athlete-dev');
  athleteDevButton.onclick = athleteDevelopmentAnalysis;
}

window.onload = initialize;
