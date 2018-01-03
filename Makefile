N=[0m
V=[01;32m
Y=[01;33m


all:
	@echo "Comandos disponibles:"
	@echo ""
	@echo " $(Y)Comandos para desarrolladores:$(N) "
	@echo ""
	@echo "   $(V)release $(N)                   Actualiza, commitea y pushea versiones y"
	@echo "                                      links de Pilas Bloques y el site. "
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
	@echo " Ciclo de deploy ante nuevo release: (leer luego de cada paso)"
	@echo "   release -> deploy -> deploy_online -> apply_deploy"
	@echo ""

preview:
	ember serve

registrar_comienzo_deploy:
	@echo "`date +%F-%T` - Comienza Deploy" >> public/deploys.log
	git add .
	git commit -m "Comienza nuevo deploy"
	git push

deploy: registrar_comienzo_deploy
	@echo "$(V)generando el deploy sólo del sitio ...$(N)"
	ember build --environment development
	scp -r dist/. pilasbloques@www.daleaceptar.gob.ar:new/
	@echo ""

deploy_online:
	@echo "$(V)iniciando deploy de la ruta /online ...$(N)"
	cd ../pilas-bloques; git pull
	cd ../pilas-bloques/; make compilar; make compilar_web
	scp -r ../pilas-bloques/dist_web/. pilasbloques@www.daleaceptar.gob.ar:new/online/
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
	@echo "                            http://pilasbloques.program.ar "
	@echo "                            http://bloques.pilas-engine.com.ar "
	@echo "                            http://program-ar.github.io/pilas-bloques "
	@echo ""
	@echo ""

iniciar:
	@echo "$(V)instalando dependencias ...$(N)"
	npm install
	bower install
	@echo "$(V)clonando el repositorio y el branch hg-pages (que sirve el sitio estático) ...$(N)"
	ln -s ../pilas-bloques
	cd app/components/; ln -s ../../pilas-bloques/app/components/pilas-acerca-de.js
	cd app/templates/components/; ln -s ../../../pilas-bloques/app/templates/components/pilas-acerca-de.hbs

iniciar_subcarpeta_online:
	@echo "$(V)clonando pilas-bloques para servir en /online ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-bloques.git pilas-bloques; cd pilas-bloques; make full;

release:
	@python extras/obtener_links.py
	git commit -am "Actualizando links de Pilas Bloques a nueva versión" 
	ember release
