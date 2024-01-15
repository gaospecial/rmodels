deploy:
	# link dist to remote gh-pages mannually \
	cd book-output; \
	# remove all contents \
	ls | xargs rm -rf; \
	git ls-files --deleted -z | xargs -0 git rm; \
	# add new contents \
	cp -r ../_book/* ./ ; \
	git add --all * ; \
	git commit -m "Update the book" || true ; \
	git reset $(git commit-tree HEAD^{tree} -m "Update the book") ; \
	git push -f -q origin gh-pages