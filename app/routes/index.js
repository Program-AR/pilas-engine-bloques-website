import Route from '@ember/routing/route';
import config from '../config/environment';

export default Route.extend({
  model: function() {
    const baseDownloadURL = `https://github.com/Program-AR/pilas-bloques/releases/download/${config.pilasBloquesVersion}/`
    return {
      version: config.pilasBloquesVersion,
      link_mac: baseDownloadURL + `pilasbloques-${config.pilasBloquesVersion}.dmg`,
      link_windows: baseDownloadURL + `pilasbloques-${config.pilasBloquesVersion}.exe`,
      link_ziplinux: baseDownloadURL + `pilasbloques-${config.pilasBloquesVersion}-linux-x64.zip`,
      link_deb: baseDownloadURL + `pilasbloques_${config.pilasBloquesVersion}_amd64.deb`
    };
  },

  actions: {
    registrarDescarga: function(so) {
      ga('send', { // jshint ignore: line
        hitType: 'event',
        eventCategory: 'Downloads',
        eventAction: 'Download ' + so,
        eventLabel: 'Version ' + config.pilasBloquesVersion,
      });
    }
  }
});
