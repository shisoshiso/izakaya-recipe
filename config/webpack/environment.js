const { environment } = require('@rails/webpacker')

// CSSの設定JQueryを使えるように
var webpack = require('webpack');
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/jquery',
        Popper: ['popper.js', 'default']
    })
)

const sassLoader = environment.loaders.get('sass');
// using dart-sass
const sassLoaderConfig = sassLoader.use.find(function(element) {
  return element.loader === 'sass-loader';
});
sassLoaderConfig.options.implementation = require('sass');

module.exports = environment
