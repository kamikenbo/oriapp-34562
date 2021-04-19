# README



## アプリケーション名
『Iku Papa』

## アプリケーション概要
０歳〜３歳時の子供の育児に対しての悩みや相談を解決するためのお父さん向けのコミュニケーションツールアプリです。お父さんの経験を元に、食事、遊び、イヤイヤ期の３つの悩みをメインに解決することを目的としてます。

## URL
https://oriapp-34562.herokuapp.com/

## 認証コード
ID: kamiken
Pass: 0420

## 利用目的
新規登録でニックネーム,email,password,お子様の名前、生年月日を記入して登録していただきます。その後投稿欄で画像もしくは動画、概要、カテゴリー４つ（どんな状況）かを選んで記載いただきます。また、他のユーザーの投稿にコメントしたり、検索機能を用いてこのような状況の時にどうやって対応しているかなどを検索することが可能です。また、マイページもあり自分の投稿した一覧を見ることができ、編集も削除も可能です。

## 目指した課題
０歳〜３歳になるまでの子供を育てていく中で、お父さんとしてできる限りのことをする上で楽しみや悩みを共有して子育てを頑張っていきたいのと、ママの負担を少しでも軽くするためのコミュニケーションアプリです。

## 洗い出した要件定義

| 優先順位（高:3,中:2,低:1) | 機能          |目的                             |詳細                       |ストーリー（ユースケース）  |見積もり（所要時間）|
|------------------------|---------------|--------------------------------|--------------------------|------------------------|-----------------| 
| 3 | 投稿機能 | 限定したワードで投稿を可能にする |	ログインしていて、画像、動画、概要、カテゴリーに記載する４つの条件を記入いただければ投稿できる | 入力欄の画像と動画と概要はなんでも選択し記載はできるが、カテゴリー欄はアクティブハッシュににより限定されており選択式になっている。| 5 |
| 2	| コメント機能 | 投稿に対してコメントできるようにする |	投稿された画面でコメントをするボタンを押すとコメント欄に進める | ユーザー登録は前提 | 5 |
| 2 |	検索検索 | ユーザーが簡単にデータ検索出来るようにする	|いくつかの条件を指定した上で投稿の検索を可能にする	| ・数回投稿されていることが前提 ・概要とカテゴリーの４つの条件の１つが入っていれば検索条件を指定できる・条件に該当する投稿の検索結果のページで表示する" | 5 |
| 2 |	ユーザー登録機能 | 投稿や検索をした際のユーザーを見分けるため |	ユーザーを特定します | ニックネーム、Email、パスワード、子供名前、子供の誕生日を記載することで登録が可能 | 5 |
| 1 | いいね機能| コメントに対して気軽に押せるアクション | 投稿されたコメントに対して、ログインされたユーザーのみできる |	ユーザー登録は必須 | 5 |
| 1 |	動画投稿機能 | 投稿の際に動画を投稿できる |	画像の代わりに動画を投稿できる | ユーザー登録は必須 | 5 |

## 説明した機能についてのGIFと説明
### トップページ動画：
### 投稿ページ動画：
### いいね機能：
### 動画投稿機能：
### 検索機能：

## 実装予定の機能
### タグ付け機能
### 画像と動画のプレビュー機能
### ユーザー登録の編集機能

## データベース設計
## users テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| email  | string | null: false, unique: true|
| nickname | string | null: false |
| encrypted_password| string | null: false | 
| baby_name | string | null: false |
| birthday | date | null: false |

association
-has_many :tweets
-has_many :comments
-has_many :likes
-has_many :tweets, through: :likes


## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| content | text    | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| baby_age_id | integer | null: false |
| baby_gender_id | integer | null: false |
| user | references | null: false, foreign_key: true |

association
-belongs_to :user
-has_many :comments
-has_many :likes
-has_many :users, through: :likes

active hash
-belongs_to :category_id
-belongs_to :condition_id
-belongs_to :baby_age_id
-belongs_to :baby_gender_id

## like テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

association
-belongs_to :user
-belongs_to :tweet

## 使用技術（開発環境）
### バックエンド
Ruby,Ruby on Rails
### フロントエンド
HTML,CSS,
### データベース
MYSQL,SequelPro
### インフラ
未実装
### アプリケーションサーバー（本番環境）
Heroku
### テスト
Rspec
### エディター
VScode
### Rails バージョン
Rails 6.0.3.5