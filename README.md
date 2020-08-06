# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| first_name      | string | null: false |
| family_name     | string | null: false |
| furigana_first  | string | null: false |
| furigana_family | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_one  :transaction

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| info               | string     | null: false                    |
| category           | integer    | null: false                    |
| sales_status       | integer    | null: false                    |
| shipping_fee       | integer    | null: false                    |
| prefecture         | integer    | null: false                    |
| scheduled_delivery | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :transaction
- has_one    :shipping_address

## transactions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## shipping_address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_number        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :item
