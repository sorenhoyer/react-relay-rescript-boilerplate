const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const webpack = require("webpack");

const outputDir = path.join(__dirname, "assets");

module.exports = {
  entry: "./src/Index.bs.js",
  mode: "development",
  output: {
    path: outputDir,
    publicPath: "/",
    filename: "index.js"
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "index.html"
    }),
    new webpack.DefinePlugin({
      __DEV__: JSON.stringify(process.env.NODE_ENV !== "production")
    })
  ],
  devServer: {
    compress: true,
    contentBase: outputDir,
    host: '0.0.0.0',
    port: process.env.PORT || 3000,
    historyApiFallback: true,
    // hot: true,
  },
};
