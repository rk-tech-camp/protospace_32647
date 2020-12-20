# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string |             |
| password | string |             |
| profile  | text   |             |
|occupation| text   |             |
| position | text   |             |

* ユーザーの名前
* ユーザーのEmail
* ユーザーのパスワード


### Association
- has_many :prototype
- has_many :comment
- 
  

## prototype テーブル

| Column     | Type   | Options     |
| ------     | ------ | ----------- |
| title      | string | null: false |
|catch_copy  | text   |             |
|concept     | text   |             |
|user        | reference            |

* タイトル名
* キャッチコピー
* コンセプト
* user


### Association

- belong_to:user
- has_many :prototype

   

## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| content  | text       |  null: false                   |
| prototype| references |                                |
| user     | references |                                |

* prototype foreign_key
* user    foreign_key
*

### Association

- belongs_to :prototype
- belongs_to :user