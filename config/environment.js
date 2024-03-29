'use strict';

const fs = require('fs')

const pilasBloquesSubprojectVersion = (critical = false) => {
  try {
    const pbPackage = fs.readFileSync('pilas-bloques/package.json', 'utf8')
    return JSON.parse(pbPackage).version
  } catch (err) {
    if(critical){
      console.error(err)
      throw "Could not retrieve Pilas Bloques version from subproject"
    }
  }
}

module.exports = function(environment) { 

  let ENV = {
    modulePrefix: 'pilas-engine-bloques-website',
    environment: environment,
    rootURL: '/',
    locationType: 'hash',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. EMBER_NATIVE_DECORATOR_SUPPORT: true
      },
      EXTEND_PROTOTYPES: {
        // Prevent Ember Data from overriding Date.parse.
        Date: false
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    pilasBloquesVersion: pilasBloquesSubprojectVersion() || 'versionMissing',
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
    ENV.APP.autoboot = false;
  }

  if (environment === 'production') {
    ENV.pilasBloquesVersion = pilasBloquesSubprojectVersion(true)
  }

  return ENV;
};
