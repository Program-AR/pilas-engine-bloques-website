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
	echo "\n" >> README.md
	git add .
	git commit -m "actualizacion..."
	git push
	ember build --environment development
	cd ../ghpages__pilas-engine-bloques-website; git pull
	cp -r -f dist/* ../ghpages__pilas-engine-bloques-website/
	cp CNAME ../ghpages__pilas-engine-bloques-website/
	cd ../ghpages__pilas-engine-bloques-website/; git add --all .; git commit -m "update"; git push origin gh-pages
	
	@echo ""
	@echo " * Subiendo los cambios a: http://bloques.pilas-engine.com.ar "
	@echo "                           (http://hugoruscitti.github.io/pilas-engine-bloques) "
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
	npm install
	bower install
	cd ../; git clone http://github.com/hugoruscitti/pilas-engine-bloques.git ghpages__pilas-engine-bloques-website; cd ghpages__pilas-engine-bloques-website; git checkout gh-pages;


release:
	@python extras/obtener_links.py


