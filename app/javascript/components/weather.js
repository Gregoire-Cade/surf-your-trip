export const getWeather = () => {
  console.log("hello");
  const detailsContainer = document.querySelector(".spot-details-container");
  const apiKey = detailsContainer.dataset.stormglassApiKey;
  const latitude = detailsContainer.dataset.latitude;
  const longitude = detailsContainer.dataset.longitude;
  const params = 'airTemperature,waterTemperature,windDirection,windSpeed,waveHeight';
  function text(d) {
        let directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];

        d += 22.5;

        if (d < 0)
            d = 360 - Math.abs(d) % 360;
        else
            d = d % 360;

        let w = parseInt(d / 45);
        return `${directions[w]}`;
    }


fetch(`https://api.stormglass.io/v2/weather/point?lat=${latitude}&lng=${longitude}&params=${params}`, {
  headers: {
    'Authorization': apiKey
  }
}).then((response) => response.json()).then((data) => {
  // Do something with response data.
  console.log(data);
  const airTemperature = Object.values(data.hours[12].airTemperature)[0];
  document.getElementById("airtemperature").innerText = airTemperature;

  const waterTemperature = Object.values(data.hours[12].waterTemperature)[0];
  document.getElementById("watertemperature").innerText = waterTemperature;

  const waveHeight = Object.values(data.hours[12].waveHeight)[0];
  document.getElementById("waveheight").innerText = waveHeight;

  const windDirection = Object.values(data.hours[12].windDirection)[0];
  const windSpeed = Object.values(data.hours[12].windSpeed)[0];
  document.getElementById("wind-direction").innerHTML = `${text(windDirection)}<span id="windspeed">${windSpeed} km/h</span>`;
  console.log(text(windDirection));
  document.getElementById("wind-arrow").classList.add(text(windDirection).toLowerCase());

});
}














