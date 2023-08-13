# unitv2_julius


# 概要
M5Stack UnitV2で音声認識システム[Julius](https://julius.osdn.jp/)を動かします。
※ 各手順でsudoのパスワードを聞いてくる場合がありますが、それについては省略しています。

 # 環境

 - Ubuntu 22.04
 - VSCode + Docker機能拡張
 - Docker 20.10.16

# (0)事前準備(UnitV2上の作業)

UnitV2上でSCPファイル転送を可能にしておく必要があります。下記のブログを参照して設定してください。

[【中級者向け】M5Stack UnitV2をハックするためのTips](https://raspberrypi.mongonta.com/m5stack-unitv2-tips-for-hack/)

 # (1)母艦PC上での作業

 ## 1. VSCodeでフォルダを開く

 右下に「コンテナーで再度開く（ReOpen Container）」のボタンがでるのでクリックします。
開くとビルドが始まり、コンテナ上に/external/julius_files.tarというファイルが作成されます。


 ## 2. ファイルのコピー

 VSCodeのターミナルを開き、下記のコマンドを実行してください。

 ```sh ./00_filecopy.sh```

 ## 3. dictation-kit-4.1.tar.gzをダウンロード

 ブラウザを起動して、下記のリンクを開いてください。<br>
SSL証明書が切れているようで、プライバシーエラーの警告が出ますがそのまま進むとダウンロードできます。<br>
※ dictation-kit-v4.3.1が最新ですがサイズが大きくUnitV2では実行できません。

ダウンロード後```./files_to_unitv2/```にコピーしてください。

[ja.osdn.netのdictation-kit-v.4.1.tar.gzへのリンク](https://ja.osdn.net/projects/julius/downloads/51158/dictation-kit-v4.1.tar.gz/)

## 4. 転送ファイルの確認

この状態で下記の4つのファイルが```files_to_unitv2```フォルダに存在しているのを確認してください。
- dictation-kit-v4.1.tar.gz
- execute_on_unitv2.sh
- julius_files.tar
- start_julius.sh

## 5. UnitV2へファイルをコピー

UnitV2を母艦PCにUSBケーブルで接続します。

下記のコマンドを実行してください。(4のファイルをUnitV2の/home/m5stackにコピーします。)

```sh ./01_scp_to_unitv2.sh```

## 6. UnitV2へssh接続

**VSCodeのターミナルではなく**Linuxのターミナルを開いてssh接続します。

```ssh m5stack@10.254.239.1```

次の手順からはUnitV2にssh接続して行います。

# (2)UnitV2上での作業

## 1. シェルの実行

下記のコマンドを実行します。

```sh ~/execute_on_unitv2.sh```

## 2. Juliusの実行

```sh ~/start_julius.sh```

# 補足

## Juliusのパラメータ変更
これはJuliusのドキュメントを参照してください。
```/home/m5stack/dictation-kit-v4.1/fast.conf```を調整します。

## UnitV2-USBの場合
USB接続のマイクを使用する前に、alsamixerを実行してマイクのボリュームを設定しておく必要があります。(初期値:0)

```sudo alsamixer```


# LICENSE

[MIT](https://github.com/mongonta0716/unitv2_julius/blob/main/LICENSE)

# AUTHOR

[Takao Akaki](https://github.com/mongonta0716)