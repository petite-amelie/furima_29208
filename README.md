# テーブル設計

## users テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| nickname             | string     | null: false                    |
| email                | string     | null: false                    |
| password             | string     | null: false                    |
| first_name           | string     | null: false                    |
| family_name          | string     | null: false                    |
| first_name_furigana  | string     | null: false                    |
| family_name_furigana | string     | null: false                    |
| birth_day            | date       | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :comments
- has_many :orders



## destination テーブル
| Column            | Type       | Options     |
| ----------------- | ---------- | ----------- |
| post_code         | string     | null: false |
| prefecture_id     | integer    | null: false |
| city              | string     | null: false |
| building_name     | string     |             |
| house_number      | string     | null: false |
| phone_number      | string     | null: false |

### Association

- belongs_to :prefectures
- belongs_to :orders


## items テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------  |
| name              | string     | null: false                   |
| price             | integer    | null: false                   |
| introduction      | text       | null: false                   |
| item_image_id     | integer    | null: false                   |
| category_id       | integer    | null: false                   |
| item_condition_id | integer    | null: false                   |
| prefecture_id     | integer    | null: false                   |
| postage_id        | integer    | null: false                   |
| preparation_id    | integer    | null: false                   |
| user_id           | integer    | null: false foreign_key :true |

### Association

- has_one :item_image
- has_one :order
- has_many :comments
- belongs_to_active_hash :categories
- belongs_to_active_hash :item_conditions
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :postage_types
- belongs_to_active_hash :preparations
- belongs_to_active_hash :users


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |
| comment | text       | null: false                    |

### Association

- belongs_to :users
- belongs_to :items


## item_images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| url     | string     | null: false                    |

### Association

- belongs_to :items


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :destination




# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
