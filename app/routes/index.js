import Route from '@ember/routing/route';

export default Route.extend({
  model: function() {
    return {
      version: "1.5.1",
      fecha: "2019-09-11",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.1/pilasbloques-1.5.1.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.1/pilasbloques-1.5.1.exe",
      link_ziplinux: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.1/pilasbloques-1.5.1-linux-x64.zip",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.1/pilasbloques_1.5.1_amd64.deb"
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
