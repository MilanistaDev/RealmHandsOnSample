# RealmHandsOnSample

## 概要
2016/03/12 にあった Realm のハンズオン#1 (iOS) の内容です。  
Qiita に記事を書きましたので見比べながら  
実際に手を動かしながらやってみていただければ幸いです。  
Github で diff(差分) を見るのがいいと思います。

## 内容
* ツイッターでタイムライン取得
* 新しいツイートを取得し表示(ツイートがバッティングしたものは一つだけマージ)
* ツイート情報は Realm のモデルで管理
* ツイート情報を Realm に保存
* タイムラインでツイートセルをタップすることでお気に入り登録
* お気に入りタブでお気に入り登録したツイートを表示

## 内容2(後日対応)
* マイグレーション
* UIRefreshControl で最新ツイート取得
* Realm のソート(時系列でツイートを表示)

## Realm について
>Realm is a replacement for SQLite & Core Data.
It can save you thousands of lines of code & weeks of work,
and lets you craft amazing new user experiences.

* SQLite や Core Data に変わる次世代データベース
* 無料で使える
* 最初の学習コストが少ないので導入しやすい
* 岸川さん曰くまずは検討してみてくれとのこと

## 導入
Twitter，Realm に関連しない部分までを GitHub に用意しました。  
master ブランチをチェックアウトして動作確認してみてください。  
ここまでの実装で気になる方は master ブランチのコミット履歴をごらんください。  
TimeLine と Favorites Tweet が 2 つのタブに適用されているはずです。  

```bash:ターミナル
$ cd ~/Downloads(など適切な場所)
$ git clone https://github.com/MilanistaDev/RealmHandsOnSample.git
$ cd RealmHandsOnSample/
$ git checkout master
```
git と cocoapods は使えるようにしておいてください。  
変数宣言時に多くが型まで指定していますが，わかりやすくするためです。  
明らかに明確である場合省いても構いません。

## CocoaPods から Realm 導入
今回は，Swift 2.2 でやります。Podfile は用意しておきましたので，  
master ブランチにチェックアウトして，pod install してください。  

CocoaPods は 0.39.0 以降対応のようです。

```bash:ターミナル
$ cd RealmHandsOnSample/
$ git checkout master
$ pod install
```
他にも直接ドラッグアンドドロップで導入する方法と，  
Carthage(カルタゴ)で導入する方法があるようです。

公式サイト参照してください。
[https://realm.io/docs/swift/latest/](https://realm.io/docs/swift/latest/)

Realm を使う部分からの実装はブランチを分けています。  
**feature/twitter-realm** で実装していますので参考にしてください。
