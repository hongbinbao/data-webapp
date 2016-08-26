####data-webapp
=====================
###### environment
    nodejs: >=5.0.0 (switch nodejs version by:  nvm use v5.0.0)

###### Quickstart

1. `cd data-webapp`
2. `npm install`
3. `gulp` or `gulp build`
4: `gulp dist`
5. `gulp demoserver` or `NODE_ENV=product gulp demoserver`

Open your web browser to 127.0.0.1:4000.

###### Tests
To run unit tests:

1. `gulp test`
2. `testem`

###deploy step
gulp build
gulp dist
gulp demoserver (NODE_ENV=product gulp demoserver)









