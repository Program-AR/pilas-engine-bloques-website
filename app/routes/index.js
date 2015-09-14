import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.8.4",
      fecha: "2015-09-14",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.8.4/pilas-engine-bloques-0.8.4.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.8.4/pilas-engine-bloques-0.8.4.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
