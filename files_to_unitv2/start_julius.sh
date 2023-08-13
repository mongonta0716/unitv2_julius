#!/bin/sh

cd ~/dictation-kit-v4.1
sudo julius -C fast.jconf | iconv -f eucjp -t UTF-8
