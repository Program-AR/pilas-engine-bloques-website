import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.7.6",
      fecha: "2015-08-26",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.7.6/pilas-engine-bloques-0.7.6.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.7.6/pilas-engine-bloques-0.7.6.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
