#!/bin/sh

git clone https://github.com/dhoessl/harmonic_page.git
cd harmonic_page/files/harmonic

hugo mod init harmonic
hugo mod get -u
hugo --destination /public

exit 0
