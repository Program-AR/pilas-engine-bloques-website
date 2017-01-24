import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "1.1.2",
      fecha: "2017-01-24",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/1.1.2/pilas-bloques-1.1.2.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/1.1.2/pilas-bloques-1.1.2.exe",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/1.1.2/pilas-bloques_1.1.2-1_all.deb",
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
