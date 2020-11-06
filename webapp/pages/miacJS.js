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

function collabpsibles(){
  alert('collapsible')
  var coll = document.getElementsByClassName("collapsible");
  var i;

  for (i = 0; i < coll.length; i++) {
    coll[i].addEventListener("click", function() {
      this.classList.toggle("active");
      var content = this.nextElementSibling;
      if (content.style.display === "block") {
        content.style.display = "none";
      } else {
        content.style.display = "block";
      }
    });
  }
}

function directSearch(){
  alert('search')
  location.href = "search.html";
}

function initialize() {
  screenDimensions();

  //doesn't work
  var teamPerformanceButton = document.getElementById("team-performance");
  var teamDepthButton = document.getElementById("team-depth");
  var athleteDevButton = document.getElmentById("athlete-dev");
  teamPerformanceButton.onclick = collapsibles;
  teamDepthButton.onclick = collapsibles;
  athleteDevButton.onclick = collapsibles;

  //doesn't work
  var searchButton = document.getElementbyId("input-search");
  searchButton.onclick = directSearch;
}

window.onload = initialize;
