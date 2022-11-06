#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

FROM node:10-alpine

RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY assets/githubwhite.png ./assets/githubwhite.png
COPY assets/linkedinwhite.png ./assets/linkedinwhite.png
COPY assets/profile.png ./assets/profile.png
COPY assets/umd-logo.png ./assets/umd-logo.png
COPY package.json ./
COPY index.html ./
COPY css/style.css ./css/style.css
COPY app.js ./
COPY nginx-conf/nginx.conf ./nginx-conf/nginx.conf

RUN npm install

EXPOSE 8080

CMD ["node", "app.js"]
