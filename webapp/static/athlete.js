/*
  athlete.js
  a class representing a single athlete and their performances
  for the MIAC webapp
*/

export default class Athlete {

  constructor(name, team) {
    this.name = name;
    this.team = team;
    this.years = [];
    this.places = [];
    this.times = [];
  }

  addPerformance(year, place, time) {
    this.years.push(year);
    this.places.push(place);
    this.times.push(time);
  }
}
