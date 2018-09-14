# docker-compose.yml for pleroma


## Usage
`setup.sh`の内容をよーく確認して(適宜変更を加えて)から、スクリプトを実行してください。nvim はお好きなテキストエディタに変更してください。

```
./setup.sh
```

`setup.sh`の途中でnvimが開かれてますが、`config/prod.secret.exs`は、docker-compose.ymlのdbに合わせて適宜書き換えます。
`pasword: `の`<generated postgres password>`はメモを取っておきます。
```config/prod.secret.exs
 # Configure your database
 config :pleroma, Pleroma.Repo,
   adapter: Ecto.Adapters.Postgres,
   username: "pleroma",
   password: "<generated postgres password>",
+  database: "pleroma",
+  hostname: "db",
-  database: "pleroma_dev",
-  hostname: "localhost",
   pool_size: 10

```

`docker-compose.yml`の`POSTGRES_PASSWORD`に先に取っておいた`<generated postgres password>`を貼りつけます。
```docker-compose.yml
+      - POSTGRES_PASSWORD=<generated postgres password>
-      - POSTGRES_PASSWORD=postgres
```
変更したら上書き保存してください。


最後に起動して完了です。
```
sudo docker-compose up -d
```


`clean.sh`の使用には注意してください。設定ファイルを全て消すだけでなく、postgresフォルダも削除しています。

## Raspberry PI
Raspberry PI で実行する際は、`Dockerfile`の先頭を編集します。
```Dockerfile
+FROM joakimk/rpi-elixir
+#FROM elixir:1.7-alpine
-#FROM joakimk/rpi-elixir
-FROM elixir:1.7-alpine
```
その他の手順は変わりありません。


## 参考
- [Dockerでお手軽Pleromaインスタンス構築](https://qiita.com/jqtype/items/c6359924dfbe3f6e6e53)
- [39e/pleroma](https://github.com/39e/pleroma)

を参考にさせていただいております。_:bow:
