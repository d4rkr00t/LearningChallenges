require("./style.css");

// inject bundled Elm app into div#main
var Elm = require("../elm/Main");
Elm.Main.embed(document.body);
