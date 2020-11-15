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

function teamPerformanceAnalysis(){
  
}

function initialize() {
  var searchButton = document.getElementById("input-search");
  searchButton.onclick = onSearchButton;

  var teamPerformanceButton = document.getElementById("team-performance");
  var teamDepthButton = document.getElementById("team-depth");
  var athleteDevButton = document.getElementById("athlete-dev");
  teamPerformanceButton.onclick = collapsibles;teamPerformanceAnalysis;
  teamDepthButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;
}

window.onload = initialize;
