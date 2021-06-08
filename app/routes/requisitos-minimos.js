import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';

export default Route.extend({
    artifact_links: service('artifact-links'),
    model: function() {
        return this.get('artifact_links').links
    },
});
