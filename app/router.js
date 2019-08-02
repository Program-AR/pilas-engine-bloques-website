import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('demo', {path: "/demo/:actividad"});
  this.route('requisitos-minimos', {path: "/requisitosMinimos"});
  this.route('notas-de-version', {path: "/notasDeVersion"});
});

export default Router;
