# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_reading | string | null: false               |
| last_name_reading  | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| item_name        | string     | null: false                    |
| item_description | text       | null: false                    |
| category         | integer    | null: false                    |
| item_condition   | integer    | null: false                    |
| shipping_cost    | integer    | null: false                    |
| shipping_source  | integer    | null: false                    |
| days_to_ship     | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record

## addresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |

### Association

- belongs_to :purchase_record

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address
