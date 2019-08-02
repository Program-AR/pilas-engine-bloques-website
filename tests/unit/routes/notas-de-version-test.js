import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | notas de version', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:notas-de-version');
    assert.ok(route);
  });
});
