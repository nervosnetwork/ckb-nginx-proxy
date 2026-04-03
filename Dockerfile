FROM fabiocicerchia/nginx-lua:1.27.4-alpine3.21.3

LABEL description="CKB nginx reverse proxy with Lua-based RPC method filtering" \
      version="1.27.4"

RUN apk add gcc musl-dev coreutils \
    && luarocks install lua-cjson
