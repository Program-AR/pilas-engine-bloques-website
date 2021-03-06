'use strict';

const EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function (defaults) {
  let app = new EmberApp(defaults, {

    // Add options here

    'ember-font-awesome': {
      useScss: false,
      includeFontFiles: true
    }

  });

  app.import('vendor/css/bootstrap.css');
  app.import('vendor/js/bootstrap.min.js');

  return app.toTree();
};
