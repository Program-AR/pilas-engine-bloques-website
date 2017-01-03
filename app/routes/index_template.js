import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "VERSION",
      fecha: "FECHA",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilas-bloques-VERSION.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilas-bloques-VERSION.exe",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilas-bloques_VERSION-1_all.deb",
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
