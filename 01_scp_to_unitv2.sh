#!/bin/sh

# UnitV2にはgunzipコマンドがないのでtarファイルにしておく
gunzip ./files_to_unitv2/dictation-kit-v4.1.tar.gz

# scpで転送
scp ./files_to_unitv2/*.* m5stack@10.254.239.1:/home/m5stack