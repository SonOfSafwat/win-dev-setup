 #Node.Js
choco install -y nodejs-lts # Node.js LTS, Recommended for most users
# choco install -y nodejs # Node.js Current, Latest features
Update-Environment-Path
choco install -y visualstudio2017buildtools
choco install -y visualstudio2017-workload-vctools
choco install -y python2 # Node.js requires Python 2 to build native modules
# npm
npm install --global --production npm-windows-upgrade
npm-windows-upgrade --npm-version latest
npm install -g typescript
npm install -g @angular/cli
npm install -g install-peerdeps
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
npm install -g install-peerdeps