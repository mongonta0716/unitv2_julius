#!/bin/sh

echo このファイルはUnitV2へSCPで転送してからunitv2上で実行してください。

sudo mv ~/julius_files.tar /
cd /
sudo tar xvf julius_files.tar
sudo rm julius_files.tar

cd ~
tar xvf dictation-kit-v4.1.tar
rm dictation-kit-v4.1.tar

chmod +x start_julius.sh

echo 準備ができました。下記のコマンドでjuliusを起動することができます。
echo "cd ~/dictation-kit-v4.1"
echo "sudo julius -C fast.jconf | iconv -f eucjp -t UTF-8"