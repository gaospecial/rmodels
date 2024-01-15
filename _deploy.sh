#!/bin/bash

# link dist to remote gh-pages mannually
if [ -d "book-output" ]; then
    cd book-output
    echo "Entered 'book-output' directory."
    # remove all contents 
    ls | xargs rm -rf
    git ls-files --deleted -z | xargs -0 git rm; 
    # add new contents 
    cp -r ../_book/* ./
    git add --all * 
    git commit -m "Update the book" || true 
    git reset $(git commit-tree HEAD^{tree} -m "Update the book")
    git push -f -q origin gh-pages
else
  # 如果不存在，则输出错误信息
  echo "Error: 'book-output' directory not found."
  echo "Try to clone it from remote repository."
  git clone -b gh-pages `git remote get-url origin` book-output
fi


