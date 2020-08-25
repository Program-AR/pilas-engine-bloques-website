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
	@echo ""
	@echo " $(Y)Comandos para publicar en http://pilasbloques.program.ar:$(N) "
	@echo ""
	@echo "   $(V)deploy_site  $(N)              Sube el sitio a la web (directorio temporal)."
	@echo "   $(V)deploy_app$(N)                 Sube Pilas Bloques a la ruta /online (directorio temporal)."
	@echo "   $(V)apply_deploy$(N)               Aplica el deploy, poniendo a la aplicación en producción."
	@echo "   $(V)apply_deploy_no_backup$(N)     Similar al anterior, pero sin hacer backup."
	@echo "   $(V)apply_deploy_only_site$(N)     Similar al anterior, sin actualizar la app Pilas Bloques, sólo el site"
	@echo ""
	@echo ""
	@echo " Ciclo de deploy ante nuevo release de Pilas Bloques: (leer luego de cada paso)"
	@echo "   npm run pb:updatedownloadlinks -> npm run release -> deploy_site -> deploy_app -> apply_deploy"
	@echo ""
	@echo ""
	@echo " Ciclo de deploy ante un update del site: (leer luego de cada paso)"
	@echo "   npm run release -> make deploy_site -> make apply_deploy_only_site"
	@echo ""

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
	npm run build
	@echo "$(V)generando el deploy sólo del sitio ...$(N)"
	scp -r dist/. pilasbloques@www.daleaceptar.gob.ar:new/
	@echo ""

deploy_app: registrar_deploy_app
	npm run pb:build
	@echo "$(V)iniciando deploy de la app hacia new/online ...$(N)"
	scp -r pilas-bloques/dist_web/. pilasbloques@www.daleaceptar.gob.ar:new/online/
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