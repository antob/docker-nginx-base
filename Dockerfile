FROM nginx:1.10.2
MAINTAINER Tobias Lindholm <tobias.lindholm@antob.se>

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Add envplate
RUN apt-get update && apt-get install -y curl --no-install-recommends && rm -rf /var/lib/apt/lists/* && curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep

COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["/usr/local/bin/ep", "-v", "/etc/nginx/conf.d/default.conf", "--", "/usr/sbin/nginx", "-g", "daemon off;"]
