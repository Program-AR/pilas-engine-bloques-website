import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('demo', {path: "/demo/:actividad"});
  this.route('requisitos-minimos', {path: "/requisitosMinimos"});
});

export default Router;
