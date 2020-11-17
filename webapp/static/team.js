/*
  team.js
  a class to represent a single team and its performances
*/

export default class Team {

  constructor(name, location) {
    this.name = name;
    this.location = location;
    this.years = [];
    this.places = [];
    this.points = [];
  }

  addPerformance(year, place, points) {
    this.years.push(year);
    this.places.push(place);
    this.points.push(points);
  }
}
