import Route from '@ember/routing/route';

export default Route.extend({
  model: function() {
    return {
      version: "1.4.3",
      fecha: "2019-07-12",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.3/pilasbloques-1.4.3.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.3/pilasbloques-1.4.3.exe",
      link_ziplinux: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.3/pilasbloques-1.4.3-linux-x64.zip",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/1.4.3/pilasbloques_1.4.3_amd64.deb"
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
