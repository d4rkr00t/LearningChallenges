const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

module.exports = {
  entry: "./src/static/index.js",
  output: {
    path: path.join(__dirname, "dist"),
    filename: "bundle.js"
  },

  resolve: {
    extensions: [".js", ".elm"]
  },

  devtool: "cheap-eval-source-map",

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: "elm-webpack-loader"
      },
      {
        test: /\.css$/,
        use: [
          "style-loader",
          "css-loader",
          {
            loader: "postcss-loader",
            options: {
              plugins: function() {
                return [require("autoprefixer")];
              }
            }
          }
        ]
      }
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: "src/static/index.html",
      inject: "body",
      filename: "index.html"
    }),

    new CopyWebpackPlugin([{ from: "assets/" }])
  ]
};
