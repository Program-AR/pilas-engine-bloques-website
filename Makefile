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
	@echo " $(Y)Comandos para publicar en http://pilasbloques.programar.gob.ar:$(N) "
	@echo ""
	@echo "   $(V)deploy  $(N)                   Sube el sitio completo a la web."
	@echo "   $(V)deploy_online$(N)              Sube la ruta /online."
	@echo ""
	@echo " $(Y)Comandos EN DESUSO:$(N) "
	@echo ""
	@echo "   $(V)__deploy_ghpages  $(N)                   Sube el sitio completo a la web."
	@echo "   $(V)__deploy_online_ghpages$(N)              Sube la ruta /online."
	@echo ""

preview:
	ember serve

__deploy_ghpages:
	@echo "$(V)generando el deploy completo del sitio ...$(N)"
	@echo "\n" >> README.md
	@git add .
	git commit -m "actualizacion..."
	git push
	ember build --environment development
	cd ../ghpages__pilas-engine-bloques-website; git pull origin gh-pages
	cp -r -f dist/* ../ghpages__pilas-engine-bloques-website/
	cp CNAME ../ghpages__pilas-engine-bloques-website/
	cd ../ghpages__pilas-engine-bloques-website/; git add --all .; git commit -m "update"; git push origin gh-pages
	@echo ""
	@echo ""
	@echo " $(V)* Subiendo los cambios a:$(N) "
	@echo ""
	@echo "                            http://bloques.pilas-engine.com.ar "
	@echo "                            http://program-ar.github.io/pilas-engine-bloques "
	@echo "                            http://pilasbloques.programar.gob.ar "
	@echo ""
	@echo ""

__deploy_online_ghpages:
	@echo "$(V)iniciando deploy de la ruta /online ...$(N)"
	cd ../pilas-engine-bloques/; make compilar_web
	cd ../ghpages__pilas-engine-bloques-website; git pull origin gh-pages
	cp -r ../pilas-engine-bloques/dist_web/ ../ghpages__pilas-engine-bloques-website/online
	cd ../ghpages__pilas-engine-bloques-website/; git add --all .; git commit -m "update /online"; git push origin gh-pages
	@echo ""
	@echo ""
	@echo " $(V)* Subiendo la ruta /online en:$(N) "
	@echo ""
	@echo "                            http://pilasbloques.programar.gob.ar/online "
	@echo ""
	@echo ""

deploy:
	@echo "$(V)generando el deploy completo del sitio ...$(N)"
	@echo "\n" >> README.md
	@git add .
	git commit -m "actualizacion..."
	git push
	ember build --environment development
	scp -r -f -v dist pilasbloques@www.daleaceptar.gob.ar:~/new/
	@echo ""
	@echo ""
	@echo " $(V)* Subiendo los cambios a:$(N) "
	@echo ""
	@echo "                            http://bloques.pilas-engine.com.ar "
	@echo "                            http://program-ar.github.io/pilas-engine-bloques "
	@echo "                            http://pilasbloques.programar.gob.ar "
	@echo ""
	@echo ""

deploy_online:
	@echo "$(V)iniciando deploy de la ruta /online ...$(N)"
	cd ../pilas-engine-bloques; git pull
	cd ../pilas-engine-bloques/; make compilar_web
	scp -r -f -v ../pilas-engine-bloques/dist_web pilasbloques@www.daleaceptar.gob.ar:~/new/online/
	@echo ""
	@echo ""
	@echo " $(V)* Subiendo la ruta /online en:$(N) "
	@echo ""
	@echo "                            http://pilasbloques.programar.gob.ar/online "
	@echo ""
	@echo ""


iniciar:
	@echo "$(V)instalando dependencias ...$(N)"
	npm install
	bower install
	@echo "$(V)clonando el repositorio y el branch hg-pages (que sirve el sitio estático) ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-engine-bloques.git ghpages__pilas-engine-bloques-website; cd ghpages__pilas-engine-bloques-website; git checkout gh-pages;

iniciar_subcarpeta_online:
	@echo "$(V)clonando pilas-engine-bloques para servir en /online ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-engine-bloques.git pilas-engine-bloques; cd pilas-engine-bloques; make full;


release:
	@python extras/obtener_links.py
