
# possible images
- vijaymateti/hugo:latest
- klakegg/hugo:0.92.1
- docker run -i -p 1313:1313 -v ./website:/home/app -ti --network=host betterweb/hugo:latest
  - currently using this one

# getting started

re-starting bc the existing project wasnt working.
references
- https://gohugo.io/getting-started/quick-start
- https://github.com/BetterCorp/hugo
- https://github.com/monkeyWzr/hugo-theme-cactus
- git submodule add https://github.com/nodejh/hugo-theme-mini.git themes/mini



```
# gen quickstart site
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo new site quickstart
sudo chown -R ${USER} quickstart
cd quickstart

# add theme
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke

# gen first post
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo new posts/my-first-post.md
subl content/posts/my-first-post.md

# run dev server
docker run --rm -it -v $PWD/website:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo server -wD -d dev --bind=0.0.0.0

# https://github.com/BetterCorp/hugo
docker run -p 1313:1313 -v .:/home/app -ti --network=host betterweb/hugo:latest

# gen content to publish
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo --minify

```


# shell into image

```
docker run -i -t -v $PWD:/src vijaymateti/hugo:latest sh
docker run -i -p 1313:1313 -v .:/home/app -ti --network=host betterweb/hugo:latest
```

# build files
`docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo vijaymateti/hugo:latest hugo --minify`


# publish
coming soon
`sh publish.sh`
