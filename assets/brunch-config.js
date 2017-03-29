exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo:  {
        'app.js': /\.js$/
      },
      entryPoints: {
        "elm/Main.elm": "js/main.js"
      }
    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    assets: /^(static)/,
    ignored: [/elm-stuff/]
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor", "elm"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    postcss: {
      processors: [
        require('postcss-import')({
          addModulesDirectories: '.',
          path: 'node_modules'
        }),
        require('postcss-url')(),
        require('postcss-cssnext')()
      ]
    },
    elmBrunch: {
      elmFolder: "elm",
      mainModules: ["./src/App.elm"],
      // outputFolder: "vendor/client",
      outputFile: "main.js"
    },
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true
  }
};
