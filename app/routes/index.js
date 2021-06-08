import Route from '@ember/routing/route';
import config from '../config/environment';
import { inject as service } from '@ember/service';

export default Route.extend({
  artifact_links: service('artifact-links'),
  model: function() {
    return this.get('artifact_links').links
  },

  actions: {
    registrarDescarga: function(so) {
      ga('send', { // jshint ignore: line
        hitType: 'event',
        eventCategory: 'Downloads',
        eventAction: 'Download ' + so,
        eventLabel: 'Version ' + config.pilasBloquesVersion,
      });
    }
  }
});
