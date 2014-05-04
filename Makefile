
.PHONY: all
all: setup install

.PHONY: setup
setup: _refs/src/simh.trailing-edge.com/kits/uv6swre.zip

_refs/src/simh.trailing-edge.com/kits/uv6swre.zip:
	cd _refs/src/simh.trailing-edge.com/kits/;curl -Os http://simh.trailing-edge.com/kits/uv6swre.zip

.PHONY: install
install: _refs/src/simh.trailing-edge.com/kits/uv6swre.zip
	unzip _refs/src/simh.trailing-edge.com/kits/uv6swre.zip

.PHONY: boot
boot:
	pdp11 bootstrap

.PHONY: clean
clean:
	rm -f AncientUnix.pdf README.txt
	rm -f unix?_v6_rk.dsk
