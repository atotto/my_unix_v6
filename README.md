# unix v6 を動かしてみる

手元の環境：

* OSX 10.9.2

まず、実行環境となるPDP11をシミュレートするためのsimhをインストールする：

    $ brew install simh
    
ubuntuなら `$ sudo apt-get install simh` で。

これで pdp11 コマンドが利用できるようになる。

## unix v6

[http://simh.trailing-edge.com/software.html](Software Kits) から [http://simh.trailing-edge.com/kits/uv6swre.zip](UNIX V6) をダウンロードしておく。

```
$ curl -Os http://simh.trailing-edge.com/kits/uv6swre.zip
$ unzip uv6swre.zip
```

起動用にbootstrapを書いておく。pdp11コマンドにこのファイルを渡す。

bootstrap:

```
$ cat bootstrap
set cpu 11/40
set cpu u18
att rk0 unix0_v6_rk.dsk
att rk1 unix1_v6_rk.dsk
att rk2 unix2_v6_rk.dsk
att rk3 unix3_v6_rk.dsk
boot rk0
```

起動:

```
$ pdp11 boot.conf
@unix

login: root
# 
```

unixといれて起動。rootでログイン。

### 操作:

* `cd` コマンドはないので `chdir` を使う
* `halt`, `shutdown` コマンドはないので `ctrl-e` で電源断 （※ `sync` コマンドを忘れずに！）

### カスタマイズ:

http://aap.papnet.eu/docs/unix6.txt を参考に。

#### cd コマンドを導入:

テキスト通り、つらつらと：

```
# chdir /usr/source/s2
# ed sh.c
11594
561
                if(equal(cp1, "chdir")) {
s/equal(cp1, "chdir")/equal(cp1, "chdir") || equal(cp1, "cd")/p
                if(equal(cp1, "chdir") || equal(cp1, "cd")) {
w mysh.c
11614
q
# cc mysh.c
# mv /bin/sh /bin/sh_org
# mv a.out /bin/sh
# sh
```

