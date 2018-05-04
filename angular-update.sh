#!/bin/sh
echo "!-- SCRIPT TO UPDATE ANGULAR-CLI --!"

uninstall() {
	echo " "
	echo "1. Uninstall old angular-cli"
	echo "Running npm uninstall -g @angular/cli"
	npm uninstall -g @angular/cli
}

verify_cache() {
	echo " "
	echo "2. Verify npm cache"
	echo "Running npm cache verify"
	npm cache verify
}

install() {
	echo " "
	echo "3. Install updated angular-cli"
	echo "Running npm install -g @angular/cli"
	npm install -g @angular/cli@latest
}

pause_a_bit() {
	sleep 0.5
}

pause_a_bit;
uninstall;
pause_a_bit;
verify_cache;
pause_a_bit;
install;

echo "updated angular-cli";
