N=[0m
V=[01;32m



all:
	@echo "Comandos disponibles:"
	@echo ""
	@echo "   $(V)release $(N)       Actualizando releases y descargas."
	@echo ""
	@echo "   $(V)iniciar $(N)       Instala todas las dependencias."
	@echo "   $(V)preview $(N)       Muestra el sitio de forma local."
	@echo "   $(V)deploy  $(N)       Sube el sitio completo a la web."
	@echo ""
	@echo "   $(V)deploy_iframe$(N)  Sube el sitio completo a la web."
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

deploy_iframe:
	cd ../pilas-engine-bloques/; make compilar_web
	cp -r ../pilas-engine-bloques/dist_web/ public/web
	echo "\n" >> README.md
	git add public/web
	git add README.md
	git commit -m "actualizando la aplicación web (para usar desde iframe)..."
	@echo ""
	@echo " * Se realizó solamente el commit. Te faltaría ejecutar: "
	@echo "      "
	@echo "      make deploy"
	@echo "      "



iniciar:
	@echo "$(V)instalando dependencias ...$(N)"
	npm install
	bower install
	@echo "$(V)clonando el repositorio y el branch hg-pages (que sirve el sitio estático) ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-engine-bloques.git ghpages__pilas-engine-bloques-website; cd ghpages__pilas-engine-bloques-website; git checkout gh-pages;

iniciar_subcarpeta_online:
	@echo "$(V)clonando pilas-engine-bloques para servir en /online ...$(N)"
	cd ../; git clone http://github.com/program-ar/pilas-engine-bloques.git pilas-engine-bloques; cd pilas-engine-bloques; git checkout gh-pages;



release:
	@python extras/obtener_links.py
