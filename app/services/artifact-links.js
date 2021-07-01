import Service from '@ember/service';
import config from '../config/environment';

export default class ArtifactLinksService extends Service {

    get baseDownloadURL() {
        return `https://github.com/Program-AR/pilas-bloques/releases/download/${config.pilasBloquesVersion}/`;
    }
    
    get links() {
        return {
            version: config.pilasBloquesVersion,
            link_mac: this.baseDownloadURL + `pilasbloques-${config.pilasBloquesVersion}.dmg`,
            link_windows: this.baseDownloadURL + `pilasbloques-${config.pilasBloquesVersion}.exe`,
            link_ziplinux: this.baseDownloadURL + `pilasbloques-${config.pilasBloquesVersion}-linux-x64.zip`,
            link_deb: this.baseDownloadURL + `pilasbloques_${config.pilasBloquesVersion}_amd64.deb`    
        }    
    };
}
