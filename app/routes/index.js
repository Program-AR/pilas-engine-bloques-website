import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.0.1",
      fecha: "2015-05-22",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.0.1/pilas-engine-bloques-0.0.1.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.0.1/pilas-engine-bloques-0.0.1.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
