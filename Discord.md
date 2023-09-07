# Discord 対応
Linux の amd64 版の start_x.sh のみ
ムダに Discord の Rich Presence に対応しています。
start_x.sh を立ち上げた時に Discord が立ち上がっているのを
$XDG_RUNTIME_DIR/discord-ipc-0 というソケットがあるかどうかをみています。

ls -CF $XDG_RUNTIME_DIR/discord-ipc-0
/run/user/1000/discord-ipc-0=

と最後に = がついていたらソケットがあります。
一度、つくったイメージはそのソケットがあること前提で 永続的に存在します。
そのため、２度めに start_x.sh を実行して start したときに discord-ipc-0 が
ないと、エラーになってしまいます。

その場合は、Discord を再度立ち上げて discord-ipc-0 があることを
確認してください。
