const webpack = require("webpack");
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");

const isProd = process.env.NODE_ENV === "production";
const elmLoaders = [];
const plugins = [
  new HtmlWebpackPlugin({
    template: "src/static/index.html",
    inject: "body",
    filename: "index.html"
  }),

  new CopyWebpackPlugin([{ from: "./assets/", to: "./assets/" }])
];

if (!isProd) {
  // enable HMR globally
  plugins.push(new webpack.HotModuleReplacementPlugin());
  // prints more readable module names in the browser console on HMR updates
  plugins.push(new webpack.NamedModulesPlugin());

  elmLoaders.push("elm-hot-loader");
}

elmLoaders.push({
  loader: "elm-webpack-loader",
  options: { debug: !isProd }
});

module.exports = {
  entry: "./src/static/index.js",
  output: {
    path: path.join(__dirname, "dist"),
    filename: "bundle.js",
    publicPath: isProd ? "/100-days-workout/" : "/"
  },

  resolve: {
    extensions: [".js", ".elm"]
  },

  devtool: !isProd ? "cheap-eval-source-map" : "",

  devServer: {
    hot: !isProd
  },

  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: elmLoaders
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

  plugins
};
