N=[0m
V=[01;32m
Y=[01;33m


all:
	@echo "Comandos disponibles:"
	@echo ""
	@echo " $(Y)Comandos para desarrolladores:$(N) "
	@echo ""
	@echo "   $(V)release $(N)                   Actualizando releases y descargas."
	@echo ""
	@echo "   $(V)iniciar $(N)                   Instala todas las dependencias."
	@echo "   $(V)iniciar_subcarpeta_online$(N)  Instala dependencias deploy online."
	@echo "   $(V)preview $(N)                   Muestra el sitio de forma local."
	@echo ""
	@echo " $(Y)Comandos para publicar en http://pilasbloques.program.ar:$(N) "
	@echo ""
	@echo "   $(V)deploy  $(N)                   Sube el sitio completo a la web (directorio temporal)."
	@echo "   $(V)deploy_online$(N)              Sube la ruta /online (directorio temporal)."
	@echo "   $(V)apply_deploy$(N)               Aplica el deploy, poniendo a la aplicación en producción."
	@echo "   $(V)apply_deploy_no_backup$(N)     Similar al anterior, pero sin hacer backup."
	@echo ""

preview:
	ember serve

deploy:
	@echo "$(V)generando el deploy completo del sitio ...$(N)"
	@echo "\n" >> README.md
	@git add .
	git commit -m "actualizacion..."
	git push
	ember build --environment development
	scp -r dist/. pilasbloques@www.daleaceptar.gob.ar:new/
	ssh pilasbloques@www.daleaceptar.gob.ar 'cp -R web/binarios/. new/binarios'
	@echo ""
	@echo ""

deploy_online:
	@echo "$(V)iniciando deploy de la ruta /online ...$(N)"
	cd ../pilas-engine-bloques; git pull
	cd ../pilas-engine-bloques/; make compilar_web
	scp -r ../pilas-engine-bloques/dist_web/. pilasbloques@www.daleaceptar.gob.ar:new/online/
	@echo ""
	@echo ""
	@echo " $(V)* Subiendo la ruta /online en:$(N) "
	@echo ""
	@echo "                            http://pilasbloques.program.ar/online "
	@echo ""
	@echo ""

apply_deploy:
	ssh pilasbloques@www.daleaceptar.gob.ar 'mv web/ "__backups/activo_hasta_`date +%F-%T`"'
	make apply_deploy_no_backup

apply_deploy_no_backup:
	ssh pilasbloques@www.daleaceptar.gob.ar 'mv new web'
	@echo ""
	@echo " $(V)* Publicando la aplicación en:$(N) "
	@echo ""
	@echo "                            http://bloques.pilas-engine.com.ar "
	@echo "                            http://program-ar.github.io/pilas-engine-bloques "
	@echo "                            http://pilasbloques.program.ar "
	@echo ""
	@echo ""

iniciar:
	@echo "$(V)instalando dependencias ...$(N)"
	npm install
	bower install
	@echo "$(V)clonando el repositorio y el branch hg-pages (que sirve el sitio estático) ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-engine-bloques.git ghpages__pilas-engine-bloques-website; cd ghpages__pilas-engine-bloques-website; git checkout gh-pages;
	ln -s ../pilas-engine-bloques
	cd app/components/; ln -s ../../pilas-engine-bloques/app/components/pilas-acerca-de.js
	cd app/templates/components/; ln -s ../../../pilas-engine-bloques/app/templates/components/pilas-acerca-de.hbs

iniciar_subcarpeta_online:
	@echo "$(V)clonando pilas-engine-bloques para servir en /online ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-engine-bloques.git pilas-engine-bloques; cd pilas-engine-bloques; make full;


release:
	@python extras/obtener_links.py
