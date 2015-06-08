import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.1.10",
      fecha: "2015-06-08",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.1.10/pilas-engine-bloques-0.1.10.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.1.10/pilas-engine-bloques-0.1.10.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
