import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "1.4.1-beta",
      fecha: "2018-11-02",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.1-beta/pilasbloques-1.4.1-beta.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.1-beta/pilasbloques-1.4.1-beta.exe",
      link_ziplinux: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.1-beta/pilasbloques-1.4.1-beta-linux-x64.zip",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.1-beta/pilasbloques_1.4.1-beta_amd64.deb"
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
