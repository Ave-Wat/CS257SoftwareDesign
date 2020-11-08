/*
  miacJS.js
  3 November 2020
 */
function screenDimensions() {
  var win = window;
  var doc = document;
  var docElem = doc.documentElement;
  var body = doc.getElementsByTagName('body')[0];
  var x = win.innerWidth || docElem.clientWidth || body.clientWidth;
  var y = win.innerHeight|| docElem.clientHeight|| body.clientHeight;
  alert(x + ' × ' + y);
}

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

function directSearch(){
  location.href = "search.html";
}

function initialize() {
  //screenDimensions();

  //doesn't work
  var searchButton = document.getElementById("input-search");
  searchButton.onclick = directSearch;

  //doesn't work
  var teamPerformanceButton = document.getElementById("team-performance");
  var teamDepthButton = document.getElementById("team-depth");
  var athleteDevButton = document.getElementById("athlete-dev");
  teamPerformanceButton.onclick = collapsibles;
  teamDepthButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;


}

window.onload = initialize;
