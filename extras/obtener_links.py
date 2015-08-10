import os
import datetime


def modification_date(filename):
    t = os.path.getmtime(filename)
    return str(datetime.datetime.fromtimestamp(t)).split(' ')[0]

# Rutas iniciales.
directorio = os.path.expanduser("~/Dropbox/Public/releases/pilas-engine-bloques")
origen = 'app/routes/index_template.js'
destino = 'app/routes/index.js'

# Obtiene el ultimo numero de version.
listado = os.listdir(directorio)
listado = [l for l in listado if len(l.split('.')) == 3]
listado.sort(key=lambda s: map(int, s.split('.')))
version = listado[-1]

archivo_origen = open(origen, 'rt')
archivo_destino = open(destino, 'wt')

fecha = modification_date(directorio + '/' + version)

contenido = archivo_origen.read()
contenido = contenido.replace('FECHA', fecha)
contenido = contenido.replace('VERSION', version)

archivo_destino.write(contenido)
archivo_destino.close()


origen_version = "public/version_template.json"
destino_version = "public/version.json"

archivo_version_origen = open(origen_version, 'rt')
archivo_version_destino = open(destino_version, 'wt')

contenido = archivo_version_origen.read()
contenido = contenido.replace('VERSION', version)

archivo_version_destino.write(contenido)
archivo_version_destino.close()




print "Actualizando los links de descarga desde: " + directorio + '/' + version
