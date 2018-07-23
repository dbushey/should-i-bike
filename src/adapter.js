class Adapter {
  constructor() {
    this.forecastURL = 'http://localhost:3000/forecast'
    this.directionURL = 'http://localhost3000/direction'
  }

  getForecast() {
    return fetch(this.forecastURL)
    .then(r => console.log(r))
  }

  getDirection() {
    return fetch(this.directionURL)
    .then(r => console.log(r))
  }

}
