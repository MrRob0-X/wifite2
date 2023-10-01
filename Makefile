default_target: install

install:
	/usr/bin/env python3 setup.py install
	/usr/bin/env pip3 install -r requirements.txt

reaver:
	git clone https://github.com/kimocoder/reaver-wps-fork-t6x tools/reaver/
	cd tools/reaver/src/ && ./configure && make && make install

bully:
	git clone https://github.com/wiire-a/bully tools/bully/
	cd tools/bully/src/ && make && make install

pixiewps:
	git clone https://github.com/wiire-a/pixiewps tools/pixiewps/
	cd tools/pixiewps/ && make && make install

hashcat:
	git clone https://github.com/hashcat/hashcat tools/hashcat/
	cd tools/hashcat/ && make && make install

hcxdumptool:
	git clone https://github.com/ZerBea/hcxdumptool tools/hcxdumptool/
	cd tools/hcxdumptool/ && make && make install

hcxtools:
	git clone https://github.com/ZerBea/hcxtools tools/hcxtools/
	cd tools/hcxtools/ && make && make install

iw:
	git clone https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git tools/iw/
	cd tools/iw/ && make && make install

deps:
	apt update && apt install -yq cmake libssl-dev libpcap-dev libcap-dev libnl-genl-3-dev libnl-genl-3-200 python-setuptools pkg-config libcurl4-openssl-dev python2 build-essential python2-dev
	/usr/bin/env pip3 install -r requirements.txt

update:
	cd tools/reaver/ && git pull
	cd tools/bully/ && git pull
	cd tools/pixiewps/ && git pull
	cd tools/hashcat/ && git pull
	cd tools/hcxtools/ && git pull
	cd tools/hcxdumptool/ && git pull

clean:
	/usr/bin/env python3 setup.py clean
	rm -rf build/
	rm -rf dist/
	rm -rf wifite.egg-info
	rm -rf tools/reaver/
	rm -rf tools/bully/
	rm -rf tools/pixiewps/
	rm -rf tools/hashcat/
	rm -rf tools/iw/
	rm -rf tools/hcxdumptool/
	rm -rf tools/hcxtools/

help:
	@clear
	@echo "[ wifite2: make help options ]"
	@echo "----------------------------------------------------------------------"
	@echo " "
	@echo " 1. Install tools/dependencies"
	@echo " "
	@echo " make iw          : pull latest iw from git and install"
	@echo " make reaver      : pull latest reaver from git and install"
	@echo " make hashcat     : pull latest hashcat from git and install"
	@echo " make bully       : pull latest bully from git and install"
	@echo " make hcxdumptool : pull latest hcxdumptool from git and install"
	@echo " make hcxtools    : pull latest hcxtools from git and install"
	@echo " "
	@echo " 2. Update installed tools or dependencies"
	@echo " "
	@echo "make update   : update tools/dependencies installed from steps above."
	@echo "make deps     : install dependencies needed to compile/run all tools"
	@echo " "
	@echo " 3. Clean / Tests"
	@echo " "
	@echo " make test       : run runtests.sh"
	@echo " make clean      : clean setup files / tmp"
	@echo " make uninstall  : completely remove wifite2 from system"
	@echo " "
	@echo " make help	: THIS HELP MENU!"
	@echo " "
	@echo " "

test:
	sh runtests.sh

uninstall:
	rm -rf /usr/sbin/wifite
	cd ../ && rm -rf wifite2
