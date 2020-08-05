# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- has_one  :transaction

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| product_name | string     | null: false                    |
| description  | string     | null: false                    |
| detail       | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :transaction

## transactions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| card                | string     | null: false                    |
| charges             | string     | null: false                    |
| region              | string     | null: false                    |
| days_until_shipping | string     | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| address            | string     | null: false                    |
| transaction_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction
