import Route from '@ember/routing/route';

export default Route.extend({
  model: function() {
    return {
      version: "VERSION",
      fecha: "FECHA",
      link_mac: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilasbloques-VERSION.dmg",
      link_windows: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilasbloques-VERSION.exe",
      link_ziplinux: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilasbloques-VERSION-linux-x64.zip",
      link_deb: "https://github.com/Program-AR/pilas-bloques/releases/download/VERSION/pilasbloques_VERSION_amd64.deb"
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
