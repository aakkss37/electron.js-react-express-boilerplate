// webpack.main.config.cjs
const path = require('path');

module.exports = {
    entry: './src/main/main.ts', // Correct entry point
    target: 'electron-main',
    module: {
        rules: [
            {
                test: /\.ts$/,
                include: [path.resolve(__dirname, 'src/main'), path.resolve(__dirname, 'src/server'), path.resolve(__dirname, 'src/preload')],
                use: 'ts-loader',
            },
        ],
    },
    resolve: {
        extensions: ['.ts', '.js'],
    },
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'main.js',
    },
    node: {
        __dirname: false,
        __filename: false,
    },
};
