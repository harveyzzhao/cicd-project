# pull official base image
FROM node:16.13-alpine

# set working directory
WORKDIR /app

# copy repo into build destination
COPY . ./

# download yarn
RUN node -v
RUN npm -v
RUN npm install -g yarn --force
RUN yarn set version 1.22.5

# allows locally installed npm packages to be run with webpack instead of /app/node_modules/.bin/webpack
ENV PATH=/app/node_modules/.bin:$PATH

# install frontend dependencies
RUN yarn

# Expose port
EXPOSE 3000

# start app
CMD ["yarn", "start"]
