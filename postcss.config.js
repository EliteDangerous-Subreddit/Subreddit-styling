module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-nested'),
    require('autoprefixer')
    // TODO: Refactor config.rb to a plugin to rename url("images/sprite.png") to url("%%sprite%%")
  ]
}