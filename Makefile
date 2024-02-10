# SPDX-License-Identifier: AGPL-3.0-or-later

PREFIX ?= /usr/local
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
DATA_DIR=$(DESTDIR)$(PREFIX)/share

FILES=$(wildcard luks-tools)

all:

check: shellcheck 

shellcheck:
	shellcheck -s bash $(FILES)

install:

	install -vDm 755 luks-tools/mkluks "$(BIN_DIR)/mkluks"

.PHONY: check install shellcheck
