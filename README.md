
[![Build Status](https://travis-ci.org/Program-AR/pilas-engine-bloques-website.svg?branch=master)](https://travis-ci.org/Program-AR/pilas-engine-bloques-website)

¡Hola! :vulcan_salute: Este es un proyecto relacionado a [Pilas Bloques](https://pilasbloques.program.ar) :heart:. En el repositorio de ese proyecto encontrarás las guías sobre [cómo contribuir](https://github.com/Program-AR/pilas-bloques/blob/develop/CONTRIBUTING.md) y el [código de conducta](https://github.com/Program-AR/pilas-bloques/blob/develop/CODE_OF_CONDUCT.md), que son guías que aplican también a este proyecto.

Hi! :vulcan_salute: This is a project related to [Pilas Bloques](https://pilasbloques.program.ar) :heart:. In that project's repository you'll find the [contribution guidelines](https://github.com/Program-AR/pilas-bloques/blob/develop/CONTRIBUTING_en.md) and the [code of conduct](https://github.com/Program-AR/pilas-bloques/blob/develop/CODE_OF_CONDUCT_en.md) which also apply to this project.

# pilas-engine-bloques-website

Pilas Bloques main website. If you are looking for Pilas Bloques app source, it can be found [here](https://github.com/Program-AR/pilas-bloques)

## Commands

- `npm install` will install dependencies and clone subproject pilas-bloques.
- `npm test` runs tests.
- `npm start` will serve the webpage.
- `npm run build` will build the site to `dist` folder. It uses subproject `pilas-bloques` version to set download links.
- `npm run package:site` will put the site AND Pilas Bloques app in a nice ready-to-publish compressed tar.gz file. Gets Pilas Bloques from `master` branch.

## Deploy 

Deploy scripts are for now in Makefile (run `make` and read). Will soon be deprecated and replaced by npm run package:site && Docker.
