/*
   index.js
   3 November 2020

   Uses the noUiSlider library: https://refreshless.com/nouislider/
   Copyright © 2020 Leon Gersen
   Open source under the MIT license.

   Uses the Plotly library: https://plotly.com/javascript/
   Copyright © 2020 Plotly
   Open source under the MIT license.
 */

function onSearchButton(){
  var searchBar = document.getElementById('champ-search');
  var keyword = searchBar.value;
  var fieldSelect = document.getElementById('search-field-select');
  var searchField = fieldSelect.value;
  var queryString = "?field=" + searchField + "&keyword=" + keyword;
  window.location.href = "search.html" + queryString;
}

function onChangeSelectAllBox(checkbox) {
  var teamCheckboxes = document.getElementById('team-checkboxes');
  if (checkbox.checked) {
    for (var i = 0; i < teamCheckboxes.children.length; i++ ) {
      teamCheckboxes.children[i].checked = true;
    }
  } else {
    for (var i = 0; i < teamCheckboxes.children.length; i++ ) {
      teamCheckboxes.children[i].checked = false;
    }
  }
}

function initializeYearSlider() {
  var yearSlider = document.getElementById('year-slider');
  noUiSlider.create(yearSlider, {
    start: [2009, 2019],
    step: 1,
    connect: [false, true, false],
    pips: {mode: 'steps', filter: function(value, type) {
      if (type === 0) {
        return -1;
      } else {
        return 1;
      }
    }},
    range: {'min': [2009], 'max': [2019]},
    orientation: 'horizontal',
  });
}

//helper function for formatting the noUiSlider year slider
function filterPips(value, type) {
  if (type === 0) {
    return -1;
  } else {
    return 1;
  }
}

function collapsibles(){
  var collapsibles = document.getElementsByClassName("collapsible");
  for (var i = 0; i < collapsibles.length; i++) {
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
  var checkBoxValuesString = getTeamCheckboxes();
  var metric = document.getElementById('team-performances-metric').value;
  var yearsList = getYearsList();
  var yearsAsString = yearsList.join(',');
  var url = getAPIBaseURL() + '/teams_performances?metric=' + metric + '&teams=' + checkBoxValuesString + '&years=' + yearsAsString;

  fetch(url, {method: 'get'})

  .then((response) => response.json())

  .then(function(teamsPerformancesDict) {
    //input: {team1: [list of places/points from 2009 to 2019], team2: [(same)]}
    var teamPerformancesChartData = {};
    var traceList = [];

    for (var team in teamsPerformancesDict) {
      teamName = escapeDoubleQuotes(team);
      var color = getTeamColor(teamName);
      var trace = {x: yearsList, y: teamsPerformancesDict[team], name: teamName, marker: {color: color}};
      traceList.push(trace);
    }
    var plotTickSeparation = 1;
    if (metric === 'points') {
      plotTickSeparation = 15;
    }
    var layout = {yaxis: {autorange:'reversed', dtick: plotTickSeparation, title: {text: metric.charAt(0).toUpperCase() + metric.slice(1), font: {family:'Roboto'}}}, xaxis:{dtick: 1, title: {text: 'Year', font: {family:'Roboto'}}}, title: {text: 'Team Performances for ' + getYearRangeAsString(), font: {family:'Roboto'}}};
    Plotly.newPlot('teams-performances-chart', traceList, layout);
  })

  .catch(function(error) {
    console.log(error);
  });
}

function teamSpreadAnalysis(){
  var yearsAsString = getYearsList().join(',');
  var listOfYearStrings = yearsAsString.split(',');
  var checkBoxTeamsValuesString = getTeamCheckboxes();
  var limitSelection = document.getElementById('team-spread-athlete-limit').value;
  var limit = 'true';
  if (limitSelection === 'team') {
    limit = 'false';
  }
  var url = getAPIBaseURL() + '/team_spread?teams=' + checkBoxTeamsValuesString + '&years='+ yearsAsString + '&limit=' + limit;

  fetch(url, {method: 'get'})
  .then((response) => response.json())
  .then(function(teamSpreadByYearDict) {
    //{"2019":{team1:[list of 7 times], team2:[list of 7 times], etc for each selected team}, "2018":{(as before)}, etc for each selected year}
    divBody = '';
    for (var i = listOfYearStrings.length - 1; i >= 0; i--) {
      divBody += '<div class="year-boxplot" id=' + listOfYearStrings[i] + '></div>';
    }
    var contentDivElement = document.getElementById('team-spread-charts');
    contentDivElement.innerHTML = divBody;
    for (var i = listOfYearStrings.length - 1; i >= 0; i--) {
      var yearKey = listOfYearStrings[i];
      plotTeamSpread(yearKey, teamSpreadByYearDict[yearKey]);
    }
  })

  .catch(function(error) {
    console.log(error);
  });
}

function plotTeamSpread(yearString, teamSpreadsThisYear) {
  var data = [];
  for (var teamNameKey in teamSpreadsThisYear) {
    var times = teamSpreadsThisYear[teamNameKey];
    for (var i = 0; i < times.length; i++) {
      if (times[i] === null) {
        times.splice(i, 1);
      }
      times[i] = convertSecondsToMinutes(times[i]);
    }
    var teamName = escapeDoubleQuotes(teamNameKey);
    var teamColor = getTeamColor(teamName);
    var teamTrace = {
      y: times,
      type: 'box',
      name: teamName,
      marker: {color: teamColor}
    }
    data.push(teamTrace);
  }
  var layout = {title: {text: getTeamSpreadPlotTitle() + yearString,font: {family: 'Roboto'}},yaxis: {title: {text: 'Time (min)',font: {family: 'Roboto'}},autorange: 'reversed',dtick: 1}};
  Plotly.newPlot(yearString, data, layout);
}

function getTeamSpreadPlotTitle() {
  var limitSelection = document.getElementById('team-spread-athlete-limit').value;
  var title = 'Distribution of ';
  if (limitSelection === 'top7') {
    title += 'Top 7 ';
  } else {
    title += 'All '
  }
  title += 'Times by Team in ';
  return title;
}

function athleteDevelopmentAnalysis (){
  var metric = document.getElementById('athlete-dev-metric').value;
  var checkBoxValuesString = getTeamCheckboxes("team-checkboxes");
  var yearsList = getYearsList();
  if (yearsList.length < 2) {
    athleteDevUsage();
    return;
  }
  var yearsAsString = yearsList.join(',');
  var url = getAPIBaseURL() + '/athlete_development?calculate_by=' + metric + '&teams=' + checkBoxValuesString + '&years=' + yearsAsString;
  var giveAvgAsPercent = false;
  var giveAvgAsMedian = false;
  var dataFormatSelector = document.getElementById('athlete-dev-data-format');
  if (dataFormatSelector.value.split(',')[0] === 'percent') {
    giveAvgAsPercent = true;
  }
  if (dataFormatSelector.value.split(',')[1] === 'median') {
    giveAvgAsMedian = true;
  }
  fetch(url, {method: 'get'})
  .then((response) => response.json())
  .then(function(athletePerformances) {
    //{team1:{athlete_name: [[time, year],...],...}, team2:{},...}
    var athleteImprovementByTeam = {};
    for (var team in athletePerformances) {
      var athletesOnTeam = athletePerformances[team];
      var avgAthleteYearlyImprovements = [];
      for (var athlete in athletesOnTeam) {
        var currAthleteResults = athletesOnTeam[athlete];
        var currAthleteYearlyImprovements = [];
        if (currAthleteResults.length === 1) {
          //skipping athletes who only competed 1 year
          continue;
        } else {
          for (var i = 1; i < currAthleteResults.length; i++) {
            var currYear = currAthleteResults[i][1];
            var prevYear = currAthleteResults[i-1][1];
            var currTime = currAthleteResults[i][0];
            var prevTime = currAthleteResults[i-1][0];
            if (currTime != null && prevTime != null){
              var yearlyImprovement = (prevTime - currTime) / (currYear - prevYear);
              if (giveAvgAsPercent) {
                yearlyImprovement = (yearlyImprovement / currTime) * 100;
              }
              currAthleteYearlyImprovements.push(yearlyImprovement);
            }
          }
          var athleteAvgYearlyImprovement = calculateMean(currAthleteYearlyImprovements);
          if (athleteAvgYearlyImprovement != null) {
            avgAthleteYearlyImprovements.push(athleteAvgYearlyImprovement);
          }
        }
      }
      if (giveAvgAsMedian) {
        var teamAvgYearlyImprovement = calculateMedian(avgAthleteYearlyImprovements);
      } else {
        var teamAvgYearlyImprovement = calculateMean(avgAthleteYearlyImprovements);
      }
      athleteImprovementByTeam[team] = teamAvgYearlyImprovement;
    }
    plotAthleteDevelopment(athleteImprovementByTeam);
  })

  .catch(function(error) {
    console.log(error);
  });
}

function plotAthleteDevelopment(athleteDevDict) {
  document.getElementById('athlete-dev-chart').innerHTML = '';
  var data = [];
  for (var teamKey in athleteDevDict) {
    var teamName = escapeDoubleQuotes(teamKey);
    var teamColor = getTeamColor(teamName);
    var teamTrace = {
      x: [teamName],
      y: [athleteDevDict[teamKey].toFixed(2)],
      name: teamName,
      marker: {color: teamColor},
      type: 'bar'
    };
    data.push(teamTrace);
  }
  var layout = {title: {text: getAthleteDevPlotTitle(), font: {family: 'Roboto'}},yaxis: {title: {text: getAthleteDevYAxisTitle(),font: {family: 'Roboto'}}},showlegend: false};
  Plotly.newPlot('athlete-dev-chart', data, layout);
}

function getAthleteDevPlotTitle() {
  var title = 'Average Yearly Athlete Development By Team From ' + getYearRangeAsString();
  return title;
}

function getAthleteDevYAxisTitle() {
  var yAxisTitle = '';
  var dataFormat = document.getElementById('athlete-dev-data-format').value.split(',');
  var metric = document.getElementById('athlete-dev-metric');
  if (dataFormat[1] === 'mean') {
    yAxisTitle += 'Mean ';
  } else {
    yAxisTitle += 'Median ';
  }
  if (dataFormat[0] === 'unweighted') {
    yAxisTitle += 'Unweighted ';
  } else {
    yAxisTitle += 'Percent ';
  }
  yAxisTitle += 'Change in ';
  if (metric === 'place') {
    yAxisTitle += 'Place';
  } else {
    yAxisTitle += 'Time';
  }
  return yAxisTitle;
}

/*
* prints a usage statement to the Athlete Development div, to be used
* in the event of incorrect usage (ie only one year selected)
*/
function athleteDevUsage() {
  var usageStatement = 'To view athlete development charts, please select multiple years on the year slider.';
  var divElement = document.getElementById('athlete-dev-chart');
  divElement.innerHTML = usageStatement;
}

/*
* Returns a string expression of the year range (ie "2010-2015")
* selected by the year slider for use in chart titles.
*/
function getYearRangeAsString() {
  var yearsList = getYearsList();
  var yearRange = '';
  if (yearsList.length === 1) {
    yearRange += yearsList[0].toString();
  } else {
    yearRange += yearsList[0] + '-' + yearsList[yearsList.length - 1];
  }
  return yearRange;
}

function getTeamCheckboxes() {
  var checkboxDivTeams = document.getElementById('team-checkboxes');
  var checkboxTeamsValues = [];
  for (var i = 1; i < checkboxDivTeams.children.length; i++ ) {
    if (checkboxDivTeams.children[i].type == 'checkbox'){
      if(checkboxDivTeams.children[i].checked){
        checkboxTeamsValues.push(checkboxDivTeams.children[i].value);
      }
    }
  }
  var checkboxValuesString = checkboxTeamsValues.join();
  return checkboxValuesString;
}

function getTeamColor(team) {
  var teamList = ['Augsburg', 'Bethel', 'Carleton', 'Concordia-Moorhead', 'Gustavus Adolphus', 'Hamline', 'Macalester', "Saint John's", "Saint Mary's", 'St. Olaf', 'St. Thomas'];
  var colorList = ['#800000', '#000080', '#f2c649', '#A52A2A', '#000000', '#FF0000', '#FFA500', '#add8e6', '#ffcccb', '#d4af37', '#551a8b'];
  for (var i = 0; i < teamList.length; i ++){
    if(teamList[i] == team){
      return colorList[i];
    }
  }
  return -1;
}

//because of SQL, we need to replace '' with ' in team names
function escapeDoubleQuotes(teamNameString) {
  if (teamNameString === "Saint John''s" || teamNameString === "Saint Mary''s") {
    teamNameString = teamNameString.replace("''", "'");
  }
  return teamNameString;
}

function getAPIBaseURL() {
  var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
  return baseURL;
}

function calculateMean(numberList) {
  if (numberList.length === 0) {
    return null;
  }
  var sum = 0.0;
  for (var i = 0; i < numberList.length; i++) {
    sum += numberList[i];
  }
  return sum / numberList.length;
}

function calculateMedian(numberList) {
  if (numberList.length === 0) {
    return null;
  }
  numberList.sort(function(a, b) {
    return a - b;
  });
  var middleIndex = numberList.length / 2;
  if (numberList.length % 2 === 1) {
    return numberList[Math.floor(middleIndex)];
  } else {
    return (numberList[middleIndex] + numberList[middleIndex - 1]) / 2;
  }
}

function convertSecondsToMinutes(timeInSeconds) {
  var timeInMinutes = (timeInSeconds / 60).toFixed(2);
  return timeInMinutes;
}

function getYearsList() {
  var yearSlider = document.getElementById('year-slider');
  var yearsList = [];
  var startYear = parseInt(yearSlider.noUiSlider.get()[0]);
  var endYear = parseInt(yearSlider.noUiSlider.get()[1]);
  var currYear = startYear;
  while (currYear <= endYear) {
    yearsList.push(currYear);
    currYear += 1;
  }
  return yearsList;
}


function initialize() {
  var searchButton = document.getElementById("input-search");
  //enter-key functionality for the search bar
  document.getElementById("champ-search")
  .addEventListener("keyup", function(event) {
    event.preventDefault();
    if (event.keyCode === 13) {
      searchButton.click();
    }
  });
  searchButton.onclick = onSearchButton;

  initializeYearSlider();

  var selectAllCheckbox = document.getElementById('select-all');
  selectAllCheckbox.addEventListener('change', (event) => {
    onChangeSelectAllBox(selectAllCheckbox);
  })

  var teamPerformanceButton = document.getElementById('team-performance');
  var teamSpreadButton = document.getElementById('team-spread');
  var athleteDevButton = document.getElementById('athlete-dev');
  teamPerformanceButton.onclick = collapsibles;
  teamSpreadButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;

  var teamPerformanceAnalysisButton = document.getElementById('input-team-performances');
  teamPerformanceAnalysisButton.onclick = teamPerformanceAnalysis;
  var teamSpreadAnalysisButton = document.getElementById('input-team-spread');
  teamSpreadAnalysisButton.onclick = teamSpreadAnalysis;
  var athleteDevButton = document.getElementById('input-athlete-dev');
  athleteDevButton.onclick = athleteDevelopmentAnalysis;
}

window.onload = initialize;
