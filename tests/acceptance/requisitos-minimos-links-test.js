import { module, test } from 'qunit';
import { visit, currentURL } from '@ember/test-helpers';
import { setupApplicationTest } from 'ember-qunit';

module('Acceptance | Requisitos Minimos Links', function(hooks) {
  setupApplicationTest(hooks);

  test('visiting /requisitosMinimos', async function(assert) {
    await visit('/requisitosMinimos');

    const windowsLink = assert.dom("[data-test-win-link]")
    windowsLink.hasAttribute("href")
    windowsLink.containsText("instalador.exe")

    const macLink = assert.dom("[data-test-mac-link]")
    macLink.hasAttribute("href")
    macLink.containsText("instalador.dmg")

    const debianLink = assert.dom("[data-test-deb-link]")
    debianLink.hasAttribute("href")
    debianLink.containsText("paquete.deb")
  });
});
