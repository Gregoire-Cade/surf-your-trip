export const getWeather = () => {
  console.log("hello");
  const detailsContainer = document.querySelector(".spot-details-container");
  const apiKey = detailsContainer.dataset.stormglassApiKey;
  const latitude = detailsContainer.dataset.latitude;
  const longitude = detailsContainer.dataset.longitude;
  const params = 'airTemperature,waterTemperature,swellDirection,swellHeight,windDirection,windSpeed,waveHeight';

fetch(`https://api.stormglass.io/v2/weather/point?lat=${latitude}&lng=${longitude}&params=${params}`, {
  headers: {
    'Authorization': apiKey
  }
}).then((response) => response.json()).then((data) => {
  // Do something with response data.
  console.log(data);
  const airTemperature = data.hours[12].airTemperature.dwd;
  document.getElementById("airtemperature").innerText = airTemperature;

  const waterTemperature = data.hours[12].waterTemperature.meto;
  document.getElementById("watertemperature").innerText = waterTemperature;

  const swellDirection = data.hours[12].swellDirection.dwd;
  document.getElementById("swelldirection").innerText = swellDirection;
  const swellHeight = data.hours[12].swellHeight.dwd;
  document.getElementById("swellheight").innerText = swellHeight;

  const windDirection = data.hours[12].windDirection.icon;
  document.getElementById("winddirection").innerText = windDirection;
  const windSpeed = data.hours[12].windSpeed.icon;
  document.getElementById("windspeed").innerText = windSpeed;

  const waveHeight = data.hours[12].waveHeight.dwd;
  document.getElementById("waveheight").innerText = waveHeight;
});
}
