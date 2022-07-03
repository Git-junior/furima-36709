## usersテーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| real_name_two_byte_s | string | null: false               |
| real_name_two_byte_p | string | null: false               |
| real_name_kana_s     | string | null: false               |
| real_name_kana_p     | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :comments

## ordersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
