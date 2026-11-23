FROM fabiocicerchia/nginx-lua:1.31.9-alpine3.24.4

LABEL description="CKB nginx reverse proxy with Lua-based RPC method filtering" \
      version="1.31.9"

RUN apk add --no-cache coreutils \
    && apk add --no-cache --virtual .build-deps \
        make \
        gcc \
        musl-dev \
        git \
    && git clone -b 2.1.0.10 --depth 1 https://github.com/openresty/lua-cjson.git /tmp/lua-cjson \
    && cd /tmp/lua-cjson \
    && luarocks make \
    && cd / \
    && rm -rf /tmp/lua-cjson \
    && apk del .build-deps