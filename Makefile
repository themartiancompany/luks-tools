# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/luks-tools

SCRIPTS_FILES=$(wildcard luks-tools/*)
DOC_FILES=$(wildcard *.rst)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(SCRIPTS_FILES)

install: install-scripts install-doc

install-scripts:

	install -vDm 755 luks-tools/mkluks "$(BIN_DIR)/mkluks"
	install -vDm 755 luks-tools/mklukskey "$(BIN_DIR)/mklukskey"
	ln -s "$(PREFIX)/bin/mkluks" "$(BIN_DIR)/mkfs.luks"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-scripts install-doc shellcheck
