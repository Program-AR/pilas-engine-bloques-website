import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.10.0",
      fecha: "2016-03-03",
      link_mac: "http://static.pilas-engine.com.ar/pilas-engine-bloques/0.8.7/pilas-engine-bloques-0.8.7.dmg",
      link_windows: "http://static.pilas-engine.com.ar/pilas-engine-bloques/0.8.7/pilas-engine-bloques-0.8.7.exe",
      link_deb: "http://repo.huayra.conectarigualdad.gob.ar/huayra/pool/main/p/pilas-engine-bloques/",
    };
  }
});
