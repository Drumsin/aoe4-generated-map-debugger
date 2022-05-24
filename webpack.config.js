const CopyPlugin = require("copy-webpack-plugin");
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const path = require('path')

module.exports = {
	entry: {
		'build': './src/index.js'
	},
	output: {
		filename: '[name].js',
		path: path.resolve(__dirname, 'dist')
	},
	module: {
		rules: [
			{
				test: /\.txt/,
				type: 'asset/source'
			},
			{
				test: /\.(sa|sc|c)ss$/,
				use: [
					MiniCssExtractPlugin.loader,
					"css-loader",
					"postcss-loader",
					"sass-loader",
				],
			},
		]
	},
	plugins: [
		new HtmlWebpackPlugin({
			filename: 'index.html',
			hash: true,
			template: './src/index-template.html'
		}),
		new CopyPlugin({
			patterns: [
				{ from: 'src/robots.txt', to: 'robots.txt' },
			]
		}),
		new MiniCssExtractPlugin()
	]
}
