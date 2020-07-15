N=[0m
V=[01;32m
Y=[01;33m
EMBER=./node_modules/.bin/ember


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
	@echo "   $(V)deploy_site  $(N)                   Sube el sitio a la web (directorio temporal)."
	@echo "   $(V)deploy_app$(N)                 Sube Pilas Bloques a la ruta /online (directorio temporal)."
	@echo "   $(V)apply_deploy$(N)               Aplica el deploy, poniendo a la aplicación en producción."
	@echo "   $(V)apply_deploy_no_backup$(N)     Similar al anterior, pero sin hacer backup."
	@echo "   $(V)apply_deploy_only_site$(N)     Similar al anterior, sin actualizar la app Pilas Bloques, sólo el site"
	@echo ""
	@echo " Ciclo de deploy ante nuevo release de Pilas Bloques: (leer luego de cada paso)"
	@echo "   make release -> deploy_site -> deploy_app -> apply_deploy"
	@echo ""
	@echo ""
	@echo " Ciclo de deploy ante un update del site: (leer luego de cada paso)"
	@echo "   ember release -> make deploy_site -> make apply_deploy_only_site"
	@echo ""

preview:
	$(EMBER) serve

registrar_deploy_site:
	@echo "`date +%F-%T` - Comienza Deploy del sitio" >> public/deploys.log
	git add .
	git commit -m "Comienza nuevo deploy del sitio"
	git push

registrar_deploy_app:
	@echo "`date +%F-%T` - Comienza Deploy de la app Pilas Bloques" >> public/deploys.log
	git add .
	git commit -m "Comienza nuevo deploy de la app Pilas Bloques"
	git push

deploy_site: registrar_deploy_site
	@echo "$(V)generando el deploy sólo del sitio ...$(N)"
	$(EMBER) build --environment development
	scp -r dist/. pilasbloques@www.daleaceptar.gob.ar:new/
	@echo ""

deploy_app:
	@echo "$(V)iniciando deploy de la app hacia new/online ...$(N)"
	cd ../pilas-bloques; git pull
	cd ../pilas-bloques/; make limpiar_todo iniciar compilar_web
	scp -r ../pilas-bloques/dist_web/. pilasbloques@www.daleaceptar.gob.ar:new/online/
	@echo ""
	@echo " $(V)Deploy OK$(N) "
	@echo ""

apply_deploy_only_site:
	ssh pilasbloques@www.daleaceptar.gob.ar 'mv web/online new/online'
	make apply_deploy

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
	./node_modules/.bin/bower install
	@echo "$(V)clonando el repositorio y el branch hg-pages (que sirve el sitio estático) ...$(N)"
	ln -s ../pilas-bloques
	cd app/components/; ln -s ../../pilas-bloques/app/components/descripcion-acerca-de.js
	cd app/templates/components/; ln -s ../../../pilas-bloques/app/templates/components/descripcion-acerca-de.hbs

iniciar_subcarpeta_online:
	@echo "$(V)clonando pilas-bloques para servir en /online ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-bloques.git pilas-bloques; cd pilas-bloques; make full;

release:
	@python extras/obtener_links.py
	git commit -am "Actualizando links de Pilas Bloques a nueva versión" 
	$(EMBER) release

deploy_test:
	$(EMBER) build
	surge --domain sitepilasbloques.surge.sh --project ./dist/