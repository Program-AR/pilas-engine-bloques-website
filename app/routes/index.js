import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.7.4",
      fecha: "2015-08-21",
      link_mac: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.7.4/pilas-engine-bloques-0.7.4.dmg",
      link_windows: "https://dl.dropboxusercontent.com/u/1335422/releases/pilas-engine-bloques/0.7.4/pilas-engine-bloques-0.7.4.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
