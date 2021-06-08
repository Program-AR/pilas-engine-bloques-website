import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';

module('Unit | Service | artifact-links', function(hooks) {
  setupTest(hooks);

  // Replace this with your real tests.
  test('service has artifact download links', function(assert) {
    const service = this.owner.lookup('service:artifact-links');
    const links = service.links
    assert.ok(links.link_mac !== undefined, "Mac OS link should exist");
    assert.ok(links.link_windows !== undefined, "Windows link should exist");
    assert.ok(links.link_deb !== undefined, "Debian link should exist");
    assert.ok(links.link_ziplinux !== undefined, "Linux zip link should exist");
  });
});
