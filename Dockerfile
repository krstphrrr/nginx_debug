# IMAGE 1: setup node to set up angular
FROM node:latest as compile-image

RUN mkdir /opt/test
WORKDIR /opt/test
COPY . ./




# commands:
# docker image build -t nang .
# docker container run -it --rm -p 4201:4200 nang


# IMAGE 2: setting up the webserver
FROM nginx

# RUN ls /usr/share
# RUN ls /usr/share/nginx 
# RUN ls /usr/share/nginx/html 

COPY --from=compile-image /opt/test/test/index.html /usr/share/nginx/html
COPY --from=compile-image /opt/test/test/conf.d/default.conf /etc/nginx/conf.d
# RUN ls /usr/share/nginx/html 
# VOLUME 
# ubuntu volume command
# docker container run --rm --name tst -v $(pwd)/test/images:/usr/share/nginx/html/test/images -d -p 8081:80 nginx_test
# actually, it would need:
# /etc/e
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
