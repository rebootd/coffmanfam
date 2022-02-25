
# possible images
- vijaymateti/hugo:latest
- klakegg/hugo:0.92.1

# getting started

```
# gen quickstart site
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo new site quickstart
sudo chown -R ${USER} quickstart
cd quickstart

# add theme
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
echo theme = \"ananke\" >> config.toml

# gen first post
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo new posts/my-first-post.md
subl content/posts/my-first-post.md

# run dev server
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo server -wD -d dev --bind=0.0.0.0

# gen content to publish
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo --minify

```


# shell into image

```
docker run -i -t -v $PWD:/src vijaymateti/hugo:latest sh
```

# build files
`docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo --minify`
