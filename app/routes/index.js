import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.11.1",
      fecha: "2016-05-17",
      link_mac: "binarios/0.11.1/pilasBloques-0.11.1.dmg",
      link_windows: "binarios/0.11.1/pilasBloques-0.11.1.exe",
      link_deb: "binarios/0.11.1/pilasBloques-0.11.1.deb",
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
