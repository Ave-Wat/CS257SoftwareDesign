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
  var url = getAPIBaseURL() + '/teams_performances?metric=' + metric + '&teams=' + checkBoxValuesString;

  fetch(url, {method: 'get'})

  .then((response) => response.json())

  .then(function(teamsPerformancesDict) {
    //input: {team1: [list of places/points from 2009 to 2019], team2: [(same)]}
    var teamPerformancesChartData = {};
    var yearsList = ['2009', '2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019'];
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
    var layout = {yaxis: {autorange:'reversed', dtick: plotTickSeparation, title: {text: metric.charAt(0).toUpperCase() + metric.slice(1), font: {family:'Roboto'}}}, xaxis:{dtick: 1, title: {text: 'Year', font: {family:'Roboto'}}}, title: {text: 'Team Performances', font: {family:'Roboto'}}};
    Plotly.newPlot('teams-performances-chart', traceList, layout);

    /*var resultsDivElement = document.getElementById('teams-performances-content-div');
    resultsDivElement.innerHTML = divBody;*/
  })

  .catch(function(error) {
    console.log(error);
  });
}

function teamDepthAnalysis(){
  var yearsAsString = getYearRange().join(',');
  var listOfYearStrings = yearsAsString.split(',');
  var checkBoxTeamsValuesString = getTeamCheckboxes();
  var url = getAPIBaseURL() + '/team_depth?teams=' + checkBoxTeamsValuesString + '&years='+ yearsAsString;

  fetch(url, {method: 'get'})
  .then((response) => response.json())
  .then(function(teamDepthByYearDict) {
    //{"2019":{team1:[list of 7 times], team2:[list of 7 times], etc for each selected team}, "2018":{(as before)}, etc for each selected year}
    divBody = '';
    for (var i = listOfYearStrings.length - 1; i >= 0; i--) {
      divBody += '<div class="year-boxplot" id=' + listOfYearStrings[i] + '></div>';
    }
    var contentDivElement = document.getElementById('team-depth-charts');
    contentDivElement.innerHTML = divBody;
    for (var i = listOfYearStrings.length - 1; i >= 0; i--) {
      var yearKey = listOfYearStrings[i];
      plotTeamDepth(yearKey, teamDepthByYearDict[yearKey]);
    }
  })

  .catch(function(error) {
    console.log(error);
  });
}

function plotTeamDepth(yearString, teamDepthsThisYear) {
  var data = [];
  for (var teamNameKey in teamDepthsThisYear) {
    var top7Times = teamDepthsThisYear[teamNameKey];
    for (var i = 0; i < top7Times.length; i++) {
      top7Times[i] = convertSecondsToMinutes(top7Times[i]);
    }
    var teamName = escapeDoubleQuotes(teamNameKey);
    var teamColor = getTeamColor(teamName);
    var teamTrace = {
      y: top7Times,
      type: 'box',
      name: teamName,
      marker: {color: teamColor}
    }
    data.push(teamTrace);
  }
  var layout = {
    title: {
      text: 'Team Top 7 Times in ' + yearString,
      font: {
        family: 'Roboto'
      }
    },
    yaxis: {
      title: {
        text: 'Time (min)',
        font: {
          family: 'Roboto'
        }
      },
      autorange: 'reversed',
      dtick: 1
    }
  }
  Plotly.newPlot(yearString, data, layout);
}

function athleteDevelopmentAnalysis (){
  var metric = document.getElementById('athlete-dev-metric').value;
  var checkBoxValuesString = getTeamCheckboxes("team-checkboxes");
  var yearsList = getYearRange();
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
            var singleYearImprovement = currAthleteResults[i-1][0] - currAthleteResults[i][0];
            if (giveAvgAsPercent) {
              singleYearImprovement = (singleYearImprovement / currAthleteResults[i-1][0]) * 100;
            }
            currAthleteYearlyImprovements.push(singleYearImprovement);
          }
          var athleteAvgYearlyImprovement = calculateMean(currAthleteYearlyImprovements);
          avgAthleteYearlyImprovements.push(athleteAvgYearlyImprovement);
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
  var layout = {
    title: {
      text: getAthleteDevPlotTitle(),
      font: {
        family: 'Roboto'
      }
    },
    yaxis: {
      title: {
        text: getAthleteDevYAxisTitle(),
        font: {
          family: 'Roboto'
        }
      }
    },
    showlegend: false
  }
  Plotly.newPlot('athlete-dev-chart', data, layout);
}

function getAthleteDevPlotTitle() {
  var yearRange = getYearRange();
  var title = 'Average Yearly Athlete Development By Team From ';
  if (yearRange.length === 1) {
    title += yearRange[0].toString();
  } else {
    title += yearRange[0] + '-' + yearRange[yearRange.length - 1];
  }
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

function athleteDevUsage() {
  var usageStatement = 'To view athlete development charts, please select multiple years on the year slider.';
  var divElement = document.getElementById('athlete-dev-chart');
  divElement.innerHTML = usageStatement;
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
  var sum = 0.0;
  for (var i = 0; i < numberList.length; i++) {
    sum += numberList[i];
  }
  return sum / numberList.length;
}

function calculateMedian(numberList) {
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

function compareNumbers(a, b) {
  return a - b;
}

function filterPips(value, type) {
  //helper function for formatting the noUiSlider year slider
  if (type === 0) {
    return -1;
  } else {
    return 1;
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

function getYearRange() {
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

function changeSelectAllBox(checkbox) {
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

  initializeYearSlider();

  var selectAllCheckbox = document.getElementById('select-all');
  selectAllCheckbox.addEventListener('change', (event) => {
    changeSelectAllBox(selectAllCheckbox);
  })

  //var dataSelectionButton = document.getElementById('data-selection');
  var teamPerformanceButton = document.getElementById('team-performance');
  var teamDepthButton = document.getElementById('team-depth');
  var athleteDevButton = document.getElementById('athlete-dev');
  //dataSelectionButton.onload = collapsibles;
  //dataSelectionButton.onclick = collapsibles;
  teamPerformanceButton.onclick = collapsibles;
  teamDepthButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;

  var teamPerformanceAnalysisButton = document.getElementById('input-team-performances');
  teamPerformanceAnalysisButton.onclick = teamPerformanceAnalysis;
  var teamDepthAnalysisButton = document.getElementById('input-team-depth');
  teamDepthAnalysisButton.onclick = teamDepthAnalysis;
  var athleteDevButton = document.getElementById('input-athlete-dev');
  athleteDevButton.onclick = athleteDevelopmentAnalysis;
}

window.onload = initialize;
