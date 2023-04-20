set -m

if [ -z "$LOG_LEVEL" ]; then
    export LOG_LEVEL=INFO
fi

warp-svc | grep "$LOG_LEVEL" &
sleep 1
warp-cli --accept-tos set-mode proxy
warp-cli --accept-tos register
warp-cli --accept-tos connect
warp-cli --accept-tos enable-always-on

socat TCP-LISTEN:65535,fork TCP:127.0.0.1:40000

fg %1