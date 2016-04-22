import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "VERSION",
      fecha: "FECHA",
      link_mac: "binarios/VERSION/pilasBloques-VERSION.dmg",
      link_windows: "binarios/VERSION/pilasBloques-VERSION.exe",
      link_deb: "binarios/VERSION/pilasBloques-VERSION.deb",
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
