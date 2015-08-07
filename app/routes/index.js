import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.6.0",
      fecha: "2015-08-07",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.6.0/pilas-engine-bloques-0.6.0.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.6.0/pilas-engine-bloques-0.6.0.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
