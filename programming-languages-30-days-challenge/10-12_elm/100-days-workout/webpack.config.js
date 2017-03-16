const webpack = require("webpack");
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

  devServer: {
    hot: true
  },

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: [
          "elm-hot-loader",
          {
            loader: "elm-webpack-loader",
            options: {
              debug: true
            }
          }
        ]
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

    new webpack.HotModuleReplacementPlugin(),
    // enable HMR globally

    new webpack.NamedModulesPlugin(),
    // prints more readable module names in the browser console on HMR updates

    new CopyWebpackPlugin([{ from: "assets/" }])
  ]
};
