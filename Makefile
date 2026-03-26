.PHONY: build clean

CONDA_ENV = stamped

build: resume.pdf

resume.pdf: resume.tex
	conda run -n $(CONDA_ENV) tectonic resume.tex

clean:
	rm -f resume.pdf
