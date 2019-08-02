import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Route | requisitos minimos', function(hooks) {
  setupTest(hooks);

  test('it exists', function(assert) {
    let route = this.owner.lookup('route:requisitos-minimos');
    assert.ok(route);
  });
});
