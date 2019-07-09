devilish: devilish.c
	gcc -o devilish.out devilish.c

clean:
	rm -f devilish

test:
	command -v coveralls >/dev/null 2>&1 || pip3 install --user cpp-coveralls
	gcc -fprofile-arcs -ftest-coverage -o devilish.out devilish.c
	./test.sh; gcov -b devilish.c
	coveralls --exclude lib --exclude tests --gcov-options '\-lp'

uninstall:
	rm -f devilish
	rm -f devilish.c
	rm -f README
	rm -f makefile
	rm -f devilish-beckmanl.zip

zip:
	zip devilish-beckmanl.zip devilish.c README makefile
