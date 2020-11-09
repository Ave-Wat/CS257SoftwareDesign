/*
  miacJS.js
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
  /*var inputElement = document.getElementById('champ-search');
  var inputValue = inputElement.value;

  var radioButtons = document.getElementsByName('search-form');
  var radioValue;
  for(i = 0; i < radioButtons.length; i++) {
    if(radioButtons[i].checked)
      document.getElementById("result").innerHTML
      radioValue = ele[i].value;
    }
  }
  // /search?field=[athletes,teams,year]&keyword={search_text}
  var url = getAPIBaseURL() + '/search?field=[' + radioValue + ']&keyword={' + inputValue + '}';
  fetch(url, method: 'get')

  .then((response) => response.json())
  .then(function(resultList) {

  })*/
  location.href = "../templates/search.html"
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
