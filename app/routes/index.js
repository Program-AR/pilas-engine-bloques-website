import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.8.2",
      fecha: "2015-09-11",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.8.2/pilas-engine-bloques-0.8.2.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.8.2/pilas-engine-bloques-0.8.2.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
