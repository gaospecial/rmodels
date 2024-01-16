deploy:
	/bin/bash _deploy.sh

html:
	quarto render --to html

pdf:
	quarto render --to pdf

clean:
	rm index.{aux,log,tex,toc,pdf}