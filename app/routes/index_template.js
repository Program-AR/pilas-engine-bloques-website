import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "VERSION",
      fecha: "FECHA",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/VERSION/pilas-engine-bloques-VERSION.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/VERSION/pilas-engine-bloques-VERSION.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
