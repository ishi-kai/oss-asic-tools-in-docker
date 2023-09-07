# oss-asic-tools
Docker をベースとした ASIC Tools の環境を用意しました。
Chipathon2023 のジャパンチームのための環境でもあり、
OpenLane の環境でもあります。
情報はすべて日本語にする予定です(git のコメントも含めて)。

元になっているのは 
[iic-osic-tools](https://github.com/iic-jku/iic-osic-tools)
です。
IIC(Institute for Integrated Circuits) が
用意している Analog にもフォーカスした OpenLane の flow を実現する
Docker 環境です。

さらに本を正すと [FOSS-ASIC-TOOLS](https://github.com/efabless/foss-asic-tools)
ですが、こちらは開発が止まっています。efabless としては
[efabless/openlane](https://hub.docker.com/r/efabless/openlane) と
[efabless/openlane-tools](https://hub.docker.com/r/efabless/openlane-tools)
をメンテナンス管理しているようです。

# iic-osic-tools からの変更点
名称を変更しました。iic は団体名、osic は造語のようなので、efabless の
元の名前に foss-asic-tools を参考に oss-asic-tools-in-docker と
しました。foss はどうやら Free Open Source Software の略のようで、
ソフトウェア屋さんからみたら OSS は OSS であり、F があるとある種の誤解を
生むと思ったので oss としました。

# 名称変更による構成の変更
もとの構成は /foss というディレクトリの下に tools, pdks, examples という
ディレクトリ構成でしたが、伝統的な名称である /opt の下に
oss を配置しました。
後、特定の ツールが swift を要求していたのでそれも /opt の下にあります。

ユーザのデザインは /foss/designs から /headless/eda/designs と変更し
通常はホストの $HOME/eda/designs を参照しています。

# ユーザ
Docker 内の ユーザは 1000:1000 の id と gid を使用しています。
したがって、もしホストのユーザがこの ID じゃなかったら
ちょっとした混乱を生むかもしれません。ここは整理したいところでもあります。
/etc/passwd には 1000 の id は登録されておらず、
/etc/passwd と /etc/group をコピーして
libnss を利用してユーザぽい情報を提供しています。

HOME は /headless にしてあります。

/etc/passwd にユーザがないため sudo コマンドはあるものの、
sudo は使えません。

# Discord Rich Presence 対応
start_x.sh で起動時に Discord が起動されていれば discord-ipc-0 の
ソケットを共有して Discord の RPC 経由で Rich Presence に対応して
あります。

そのため、start_x.sh で起動すると「Chipathon2023 をゲーム中」
の表示がなされます。設定を抑制するには、環境変数の 
SUPPRESS_DISCORD_RP に yes を設定してください。

# 追加インストール
Docker 内でツールを追加でインストールしようと思った場合は
Docker に root で入る必要があります。
docker run で --user 0:0 をつかって立ち上げれば
root で Docker 内のイメージに入り込めるので、その後、
apt install などをして必要なツール類をインストールしてください。

# Docker image のビルド
Docker のイメージは通常 dockerhub の ishikai からバイナリとして
準備されるのでビルドの必要はないはずです。ビルドしたい場合は
```
DOCKER_LOAD=yes ./build-all.sh
```
とすればローカルにイメージを作成できることでしょう。
build には docker の buildx を必要とするため、先立って、
buildx をインストールする必要があります。
[ここ](https://zenn.dev/bells17/articles/docker-buildx)
の情報がわかりやすかった。

うまくインストールできれば docker buildx version とか
のコマンドが使えるようになる。

# ToDo
- OpenROAD のインストール確認
- 説明用ウェブ立ち上げ
  -   PDKS の説明
  -   DB 連携
- サンプル追加
- GF180 動かせるようにする
- ADC とかのサンプルを動かせるようにする
- 重複する bash コードの整理
- mlterm 対応
