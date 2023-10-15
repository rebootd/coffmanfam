
# hugo docker images
- betterweb/hugo:latest

# getting started

note: using files for themes instead of submodules. Github Actions was having trouble pulling specific commits for submodules.

```
# open hugo dev container:
> docker run -i -p 1313:1313 -v .:/home/app -ti --network=host betterweb/hugo:latest


# run dev server
> hugo server -s ./website

# build site content:
> hugo --gc --minify -s ./website

```


