# pilas-engine-bloques-website

Pilas Bloques main website. If you are looking for Pilas Bloques app source, it can be found [here](https://github.com/Program-AR/pilas-bloques)

[![Build Status](https://travis-ci.org/Program-AR/pilas-engine-bloques-website.svg?branch=master)](https://travis-ci.org/Program-AR/pilas-engine-bloques-website)

## Commands

- `npm install` will install dependencies and clone subproject pilas-bloques.
- `npm test` runs tests.
- `npm start` will serve the webpage.
- `npm run build` will build the site to `dist` folder.
- `npm run pb:updatedownloadlinks` will get subproject pilas-bloques' package.json version and date and update this site's files.
- `npm run package:site` will put the site AND Pilas Bloques app in a nice ready-to-publish compressed tar.gz file. Gets Pilas Bloques from `master` branch.

## Deploy 

Deploy scripts are for now in Makefile (run `make` and read). Will soon be deprecated and replaced by npm run package:site && Docker.