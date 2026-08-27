#!/bin/sh
# boot pe purana data B2 se wapas lao (agar hai; fail = fresh start)
litestream restore -if-replica-exists -config /etc/litestream.yml /pb/pb_data/data.db || true
# ab PocketBase chalao + har-likhai ka live-replica B2 bhejo
exec litestream replicate -config /etc/litestream.yml \
  -exec "/pb/pocketbase serve --http=0.0.0.0:${PORT:-8090} --dir=/pb/pb_data"
