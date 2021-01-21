# docker-ruby-ffprobe
A small container that includes ruby &amp; ffprobe

## Process

Decide a docker tag based on server/project name and maybe date

```
export TAGNAME=media-04-2021-01-20
```

NB: if using a branch don't make the branch the same as the tagname (too much confusion when you try to create the remote tag)

### build locally to ensure it works...

```
docker build .             
```

### Get image onto docker hub 
push the local build to docker hub

```
docker build . -t red56/docker-ruby-ffprobe:${TAGNAME}
docker push red56/docker-ruby-ffprobe:${TAGNAME}
```

### And test with circleci

when built, change ref in circeci/config.yml

### Fossilize

* commit changes and push both to branch/master and tag it
  ```
  git tag -a ${TAGNAME}
  git push origin tags/${TAGNAME}
  ```

* keep using the git == docker tag in circleci, it helps for traceability (don't switch to branch-named docker tag, despite its existance)


