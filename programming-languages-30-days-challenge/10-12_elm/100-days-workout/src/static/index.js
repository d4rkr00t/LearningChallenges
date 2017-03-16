require("./style.css");

var model = localStorage.getItem("model");
var startingModel = model ? JSON.parse(model) : null;

// inject bundled Elm app into div#main
var Elm = require("../elm/Main");
var elmApp = Elm.Main.embed(document.body, startingModel);

elmApp.ports.setStorage.subscribe(function(state) {
  localStorage.setItem("model", JSON.stringify(state));
});
