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
|image|string|

### Association
- has_many :massages
- has_many :groups

##groupテーブル
|name|string|null: false|

### Association
- has_many :messages
- has_many :users

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
