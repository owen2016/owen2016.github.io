git add -A
git commit -m "$1"
git push gitee master -f
git push github master -f

hexo clean
hexo g
hexo d