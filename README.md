# テーブル設計

## users テーブル

| Column    | Type     | Options     |
| --------  | ------   | ----------- |
| nickname  | string   | null: false |
| email     | string   | null: false |
| password  | string   | null: false |
| fullname  | string   | null: false |
| kana_name | string   | null: false |
| birthday  | datetime | null: false |

### Association

- has_many :items

## items テーブル

| Column | Type      | Options              |
| ------ | ------    | -------------------- |
| item_name          | string | null: false |
| item_description   | text   | null: false |
| Product_details    | text   | null: false |
| delivery           | string | null: false |
| price              | integer| null: false |

### Association

- has_one :buy_item
- belongs_to :user

## buy_item テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | string     | null: false |


### Association

- has_one :shipping_address
- belongs_to :item

## shipping_address テーブル

| Column        | Type     | Options     |
| -------       | -------- | ------------|
| yubinbango    | integer  | null: false |
| todoufuken    | text     | null: false |
| sichoson      | text     | null: false |
| banchi        | integer  | null: false |
| tatemono      | text     | null: false |
| tel_namber    | integer  | null: false |

### Association

- belongs_to :buy_item