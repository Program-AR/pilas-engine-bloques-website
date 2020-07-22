import Route from '@ember/routing/route';

export default Route.extend({
  model: function() {
    return {
      version: "1.6.0",
      fecha: "2020-07-22",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/1.6.0/pilasbloques-1.6.0.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/1.6.0/pilasbloques-1.6.0.exe",
      link_ziplinux: "https://github.com/Program-AR/pilas-bloques/releases/download/1.6.0/pilasbloques-1.6.0-linux-x64.zip",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/1.6.0/pilasbloques_1.6.0_amd64.deb"
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
