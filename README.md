# テーブル設計

## usersテーブル

|Column              |Type       |Options                    |
|--------------------|-----------|---------------------------|
|nickname            |string     |null: false                |
|email               |string     |null: false, unique: true  |
|encrypted_password  |string     |null: false                |
|family_name         |string     |null: false                |
|first_name          |string     |null: false                |
|family_name_kana    |string     |null: false                |
|first_name_kana     |string     |null: false                |
|birthday_year       |integer    |null: false                |
|birthday_month      |integer    |null: false                |
|birthday_day        |integer    |null: false                |

### Association
- has_many :items
- has_many :purchase_records

## purchase_recordsテーブル

|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|user                |references |null: false, foreign_key: true  |
|item                |references |null: false, foreign_key: true  |


### Association
- belongs_to :user
- belongs_to :item
- has_one :destination


## itemsテーブル

|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|image               |string     |null: false                     |
|name                |string     |null: false                     |
|description         |text       |null: false                     |
|category            |string     |null: false                     |
|item_condition      |string     |null: false                     |
|delivery_charge     |string     |null: false                     |
|delivery_area       |string     |null: false                     |
|delivery_day        |string     |null: false                     |
|price               |integer    |null: false                     |
|user                |references |null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase_record

## destinationsテーブル

|Column              |Type       |Options                         |
|--------------------|-----------|--------------------------------|
|post_code           |integer    |null: false                     |
|prefecture          |string     |null: false                     |
|city                |string     |null: false                     |
|address             |string     |null: false                     |
|building_name       |string     |null: false                     |
|phone_number        |integer    |null: false                     |
|purchase_record     |references |null: false, foreign_key: true  |

### Association
- belongs_to :purchase_record