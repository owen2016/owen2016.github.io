git add -A
git commit -m "$1"
git push gitee master
git push github master

hexo clean
hexo g
hexo d