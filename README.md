# README

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
-has_many :messages



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
-has_many :messages

active hash
-belongs_to :category_id
-belongs_to :condition_id
-belongs_to :baby_age_id
-belongs_to :baby_gender_id

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                               |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |

association
-belongs_to :user
-belongs_to :tweet

