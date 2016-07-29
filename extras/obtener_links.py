import os
import re
import datetime


MAKEFILE_PATH = "../pilas-engine-bloques/Makefile"


def modification_date(filename):
    t = os.path.getmtime(filename)
    return str(datetime.datetime.fromtimestamp(t)).split(' ')[0]

# Rutas iniciales.
directorio = os.path.expanduser("~/Dropbox/Public/releases/pilas-engine-bloques")
origen = 'app/routes/index_template.js'
destino = 'app/routes/index.js'

# Obtiene el ultimo numero de version.
f = open(MAKEFILE_PATH, "rt")
content = f.read()
f.close()

match = re.search('VERSION=(.*)', content)
version = match.group(1)

archivo_origen = open(origen, 'rt')
archivo_destino = open(destino, 'wt')

fecha = modification_date(MAKEFILE_PATH)

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




print "Actualizando los links de descarga desde el archivo Makefile:\n\t VERSION = " + version
