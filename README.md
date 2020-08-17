# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| name             | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items
- has_many :destinations

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| image       | string     | null: false                    |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | integer    | null: false                    |
| status      | integer    | null: false                    |
| burden      | integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| days        | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :destinations

## destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :items