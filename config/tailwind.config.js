const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  purge: [
    './app/assets/**/*.js',
    './app/assets/**/*.coffee',
    './app/javascript/**/*.coffee',
    './app/javascript/**/*.js',
    './app/views/**/*.haml',
    './app/views/**/*.erb',
    './app/**/*.jsx',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    // require('@tailwindcss/forms'),
    // require('@tailwindcss/typography'),
    // require('@tailwindcss/container-queries'),
  ]
}
