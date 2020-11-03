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
| birthday             | datetime | null: false |

### Association

- has_many :items
- has_many :buy_item


## items テーブル

| Column | Type      | Options              |
| ------ | ------    | -------------------- |
| item_name          | string | null: false |
| item_description   | string | null: false |
| category           | integer| null: false |
| Product_details    | integer| null: false |
| delivery_fee       | integer| null: false |
| shipping_area      | integer| null: false |
| shipping_days      | integer| null: false |
| price              | integer| null: false |

### Association

- has_one :buy_item
- belongs_to :user

## buy_item テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |


### Association

- has_one :shipping_address
- belongs_to :item
- belongs_to :user

## shipping_address テーブル

| Column        | Type     | Options     |
| -------       | -------- | ------------|
| yubinbango    | integer  | null: false |
| todoufuken    | integer  | null: false |
| sichoson      | text     | null: false |
| banchi        | integer  | null: false |
| tatemono      | text     |             |
| phone_namber  | string   | null: false |

### Association

- belongs_to :buy_item