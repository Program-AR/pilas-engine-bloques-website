import Route from '@ember/routing/route';

export default Route.extend({
  model: function() {
    return {
      version: "1.5.2",
      fecha: "2019-10-04",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.2/pilasbloques-1.5.2.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.2/pilasbloques-1.5.2.exe",
      link_ziplinux: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.2/pilasbloques-1.5.2-linux-x64.zip",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/1.5.2/pilasbloques_1.5.2_amd64.deb"
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
