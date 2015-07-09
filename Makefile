GH-PAGES = ${HOME}/dev/urubu-gh-pages/

all: build

build:
	python -m urubu build
	touch _build/.nojekyll

serve:
	tserve --prefix pyhdf_doc _build

publish:
	git subtree push --prefix _build origin gh-pages

clean:
	cd _build; rm -rf *
