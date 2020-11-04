/*
  miacJS.js
  3 November 2020
 */
function screenDimensions() {
  alert('hit dim')
  var win = window;
  var doc = document;
  var docElem = doc.documentElement;
  var body = doc.getElementsByTagName('body')[0];
  var x = win.innerWidth || docElem.clientWidth || body.clientWidth;
  var y = win.innerHeight|| docElem.clientHeight|| body.clientHeight;
  alert(x + ' × ' + y);
}

function initialize() {
  //alert('hit init');
  screenDimensions;
}

window.onload = initialize;

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
