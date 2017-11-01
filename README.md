##messagesテーブル

|Colunm|Type|Option|
|------|----|------|
|body|text|
|image|string|
|group_id|integer|null: false, freign_key: true|
|user_id|integer|null: false, freign_key: true|

### Association
- belongs_to :users
- belongs_to :group

##usersテーブル

|name|string|index: true, null: false|
|address|string|unique: true|
|pass|string|null: false|
|image|string|

### Association
- has_many :massages

##groupテーブル
|name|string|null: false|

### Association
- has_many :messages

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
