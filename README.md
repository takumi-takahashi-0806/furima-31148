# テーブル設計

## users テーブル

| Column               | Type     | Options     |
| --------             | ------   | ----------- |
| nickname             | string   | null: false |
| email                | string   | null: false |
| encrypted_password   | string   | null: false |
| frist_name           | string   | null: false |
| middle_name          | string   | null: false |
| kanafrist_name       | string   | null: false |
| kanamiddke_name      | string   | null: false |
| birthday             | date     | null: false |

### Association

- has_many :items
- has_many :buy_items


## items テーブル

| Column | Type      | Options              |
| ------ | ------    | -------------------- |
| item_name          | string | null: false |
| item_description   | string | null: false |
| category_id        | integer| null: false |
| Product_details_id | integer| null: false |
| delivery_fee_id    | integer| null: false |
| shipping_area_id   | integer| null: false |
| shipping_days_id   | integer| null: false |
| price              | integer| null: false |

### Association

- has_one :buy_item
- belongs_to :user

## buy_item テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| items  | references | foreign_key: true |


### Association

- has_one :shipping_address
- belongs_to :item
- belongs_to :user

## shipping_address テーブル

| Column        | Type     | Options     |
| -------       | -------- | ------------|
| postal_code   | string   | null: false |
| prefectures   | integer  | null: false |
| municipalities| string   | null: false |
| address       | string   | null: false |
| building      | string   |             |
| phone_namber  | string   | null: false |

### Association

- belongs_to :buy_item