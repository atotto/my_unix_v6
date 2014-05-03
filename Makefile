
.PHONY: all
all: setup install

.PHONY: setup
setup: uv6swre.zip

uv6swre.zip:
	curl -Os http://simh.trailing-edge.com/kits/uv6swre.zip

.PHONY: install
install: uv6swre.zip
	unzip uv6swre.zip

.PHONY: boot
boot:
	pdp11 boot.conf

.PHONY: clean
clean:
	rm -f AncientUnix.pdf README.txt
	rm -f unix?_v6_rk.dsk
