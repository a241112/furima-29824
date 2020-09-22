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

# テーブル設計

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | string     | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| postage       | string     | null: false                    |
| prefecture    | string     | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :images
- has_one :purchases

## purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ------     | ------------------------------ |
| user         | string     | null: false                    |
| item         | string     | null: false                    |
| post_code    | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| house_number | integer    | null: false                    |
| phone_number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :purchases

## imagesテーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| image        | string    | null: false                    |
| item_id      | reference | null: false, foreign_key: true |

### Association

- belongs_to :items