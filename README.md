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
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :transactions

## itemsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| condition     | integer    | null: false                    |
| postage       | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :transaction

## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ------     | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | integer    | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| transaction_id | integer    | null: false, foreign_key: true |

### Association

- belongs to :transaction

## transactionsテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address