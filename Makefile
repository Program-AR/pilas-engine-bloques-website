N=[0m
V=[01;32m

all:
	@echo "Comandos disponibles:"
	@echo ""
	@echo "   $(V)release $(N) Actualizando releases y descargas."
	@echo ""
	@echo "   $(V)iniciar $(N) Instala todas las dependencias."
	@echo "   $(V)preview $(N) Muestra el sitio de forma local."
	@echo "   $(V)deploy  $(N) Sube el sitio completo a la web."
	@echo ""
	
preview:
	ember serve

deploy:
	echo "\n" >> README.md
	git add .
	git commit -m "actualizacion..."
	git push
	ember build --environment production
	cd ../ghpages__pilas-engine-bloques-website; git pull
	cp -r -f dist/* ../ghpages__pilas-engine-bloques-website/
	cd ../ghpages__pilas-engine-bloques-website/; git add --all .; git commit -m "update"; git push origin gh-pages
	
	@echo ""
	@echo " * Subiendo los cambios a: http://hugoruscitti.github.io/pilas-engine-bloques "
	@echo ""

iniciar:
	npm install
	bower install
	cd ../; git clone http://github.com/hugoruscitti/pilas-engine-bloques.git ghpages__pilas-engine-bloques-website; cd ghpages__pilas-engine-bloques-website; git checkout gh-pages;


release:
	@python extras/obtener_links.py


