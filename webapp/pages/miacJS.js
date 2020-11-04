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
