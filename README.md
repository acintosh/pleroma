# docker-compose.yml for pleroma


## Usage
`setup.sh`の内容をよーく確認して(適宜変更を加えて)から、スクリプトを実行してください。
```
./setup.sh
```
その後、起動してください。
```
sudo docker-compose up -d
```


`clean.sh`の使用には注意してください。設定ファイルを全て消すだけでなく、postgresフォルダも削除しています。

## 参考
- [Dockerでお手軽Pleromaインスタンス構築](https://qiita.com/jqtype/items/c6359924dfbe3f6e6e53)
- [39e/pleroma](https://github.com/39e/pleroma)

を参考にさせていただいております。_:bow:
