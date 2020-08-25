# テーブル設計

## users テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| nickname       | string     | null: false                    |
| email          | string     | null: false                    |
| password       | string     | null: false                    |
| first_name     | string     | null: false                    |
| family_name    | string     | null: false                    |
| birth_year_id  | references | null: false, foreign_key: true |
| birth_month_id | references | null: false, foreign_key: true |
| birth_day_id   | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :comments
- has_one :destination
- has_one :credit_cards
- belongs_to :birth_years
- belongs_to :birth_months
- belongs_to :birth_days


## credit_cards テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ------------|
| card_number      | integer | null: false |
| expiration_year  | integer | null: false |
| expiration_month | integer | null: false |
| security_code    | integer | null: false |

### Association

- belongs_to :users


## destination テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | integer    | null: false                    |
| prefecture_id     | references | null: false, foreign_key: true |
| city              | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | integer    | null: false                    |

### Association

- belongs_to :users
- belongs_to :prefectures


## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| price             | integer    | null: false                    |
| introduction      | text       | null: false                    |
| item_image_id     | references | null: false, foreign_key: true |
| category_id       | references | null: false, foreign_key: true |
| item_condition_id | references | null: false, foreign_key: true |
| prefecture_id     | references | null: false, foreign_key: true |
| postage_id        | references | null: false, foreign_key: true |
| preparation_id    | references | null: false, foreign_key: true |

### Association

- has_one :item_images
- has_many :comments
- belongs_to :categories
- belongs_to :item_conditions
- belongs_to :prefectures
- belongs_to :postage_types
- belongs_to :preparations
- belongs_to :users


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
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


## categories テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| category_name | string | null: false |

### Association

- has_many :items


## item_conditions テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| item_condition | string | null: false |

### Association

- has_many :items


## prefectures テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| prefecture | string | null: false |

### Association

- has_many :items
- has_many :destination


## postage_types テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| postage_type | string | null: false |

### Association

- has_many :items


## preparation_days テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| preparation_day | string | null: false |

### Association

- has_many :items


## birth_years テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| birth_year     | integer | null: false |

### Association

- has_many :users


## birth_months テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| birth_month | integer | null: false |

### Association

- has_many :users


## birth_days テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| birth_day | integer | null: false |

### Association

- has_many :users






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
