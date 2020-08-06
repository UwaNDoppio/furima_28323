# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| first_name  | string | null: false |
| family_name | string | null: false |
| furigana    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| nickname    | string | null: false |
| birthday    | date   | null: false |

### Association

- has_many :items
- has_one  :transaction

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | string     | null: false                    |
| product_name | string     | null: false                    |
| info         | string     | null: false                    |
| price        | string     | null: false                    |
| category     | string     | null: false                    |
| sales_status | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :transaction

## transactions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| shipping_fee        | string     | null: false                    |
| prefecture          | string     | null: false                    |
| scheduled_delivery  | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| phone_number       | string     | null: false                    |
| transaction        | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction
