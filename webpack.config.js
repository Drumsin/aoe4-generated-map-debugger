const CopyPlugin = require("copy-webpack-plugin");
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const path = require('path');
const { execSync } = require('child_process'); // Add this to run the script

module.exports = {
    mode: 'production',
    resolve: {
        fallback: {
            path: false,
            fs: false,
            child_process: false,
            crypto: false,
            url: false,
            module: false
        },
    },
    experiments: {
        topLevelAwait: true,
    },
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
                test: /\.lua/,
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
            {
                test: /\.wasm/,
                type: 'asset/inline',
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
        new MiniCssExtractPlugin(),
        {
            apply: (compiler) => {
                compiler.hooks.beforeRun.tap('RunCustomTerrainTypes', () => {
                    console.log('Running custom-terrain-types.js...');
                    execSync('node src/custom-terrain-types.js', { stdio: 'inherit' });
                });
            }
        }
    ]
};
