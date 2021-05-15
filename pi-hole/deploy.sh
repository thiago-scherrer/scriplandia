#!/bin/bash

function run () {
	cd /home/pi/go-pihole/build/
	LIST=ads-trackers.txt OUTPUT=output.txt ./go-pihole
	cat output.txt \
        | sort -d \
        | uniq > ../../pi-hole-block-list/domains/big-block-list.txt
}

function deploy () {
	cd ../../pi-hole-block-list/domains/
	git add .
	git commit -m ":robot: add new domain"
	git push origin main
}

function clean () {
	cd /home/pi/go-pihole/build/
	rm output.txt -v
}

run
deploy
clean

