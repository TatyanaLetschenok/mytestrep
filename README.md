# mytestrep

##Setup instruction

should be installed:

- node
- java
- maven
- appium

###install appium
```
brew install node      # get node.js
npm install -g appium  # get appium
npm install wd         # get appium client     
```
###run appium for specific port in background

`appium -p 4723 -a 127.0.0.1 &`

###run tests for specific platform

`mvn test -Dplatform=<platform> -DappPath=<absolute_build_path>`

for ios:

`mvn test -Dplatform=ios -DappPath=<absolute_build_path> -Dtest=ios.*`

for android

`mvn test -Dplatform=android -DappPath=<absolute_build_path> -Dtest=android.*`

run specific test

`mvn test -Dplatform=ios test -DappPath=<absolute_build_path> -Dtest=ios.FindClassesTest`


