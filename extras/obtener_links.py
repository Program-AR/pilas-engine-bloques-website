import os
import subprocess
import datetime

#################################################
###### Auxiliares      ##########################
#################################################

def actualizar_index_js():
    contenido = open('app/routes/index_template.js', 'rt').read()
    contenido = contenido.replace('FECHA', fecha_pilas_bloques())
    contenido = contenido.replace('VERSION', version_pilas_bloques())
    escribir('app/routes/index.js', contenido)

def version_pilas_bloques():
    return subprocess.check_output('cd pilas-bloques; scripts/obtenerVersion.sh', shell=True).strip()

def fecha_pilas_bloques():
    return modification_date("pilas-bloques/package.json")

def modification_date(filename):
    t = os.path.getmtime(filename)
    return str(datetime.datetime.fromtimestamp(t)).split(' ')[0]

def escribir(filename,content):
    archivo = open(filename, 'wt')
    archivo.write(content)
    archivo.close()

#################################################
###### Main del script: #########################
#################################################
actualizar_index_js()

print "Actualizando los links de descarga de Pilas Bloques:\n\t VERSION = " + version_pilas_bloques()
