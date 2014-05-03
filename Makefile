

setup:
	curl -Os http://simh.trailing-edge.com/kits/uv6swre.zip

install: uv6swre.zip
	unzip uv6swre.zip

boot:
	pdp11 boot.conf

