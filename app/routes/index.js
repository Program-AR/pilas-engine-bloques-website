import Ember from 'ember';

export default Ember.Route.extend({
  model: function() {
    return {
      version: "0.10.0",
      fecha: "2016-03-03",
      link_mac: "binarios/0.10.0/pilasBloques-0.10.0.dmg",
      link_windows: "binarios/0.10.0/pilasBloques-0.10.0.exe",
      link_deb: "binarios/0.10.0/pilasBloques-0.10.0.deb",
    };
  }
});
