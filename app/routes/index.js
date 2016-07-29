import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "1.0.0",
      fecha: "2016-07-28",
      link_mac: "https://github.com/Program-AR/pilas-engine-bloques/releases/download/1.0.0/pilas-bloques-1.0.0.dmg",
      link_windows: "https://github.com/Program-AR/pilas-engine-bloques/releases/download/1.0.0/pilas-bloques-1.0.0.exe",
      link_deb: "https://github.com/Program-AR/pilas-engine-bloques/releases/download/1.0.0/pilas-engine-bloques_1.0.0-1_all.deb",
    };
  },

  actions: {
    registrarDescarga: function(so) {
      ga('send', { // jshint ignore: line
        hitType: 'event',
        eventCategory: 'Downloads',
        eventAction: 'Download ' + so,
        eventLabel: 'Version ' + this.model().version,
      });
    }
  }
});
