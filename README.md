##messagesテーブル

|Colunm|Type|Option|
|------|----|------|
|body|text|
|image|string|
|group_id|integer|null: false, freign_key: true|
|user_id|integer|null: false, freign_key: true|

### Association
- belongs_to :user
- belongs_to :group

##usersテーブル

|name|string|index: true, null: false|

### Association
- has_many :massages
- has_many :members
- has_many :groups, through: :members


##groupsテーブル
|name|string|null: false|

### Association
- has_many :messages
- has_many :members
- has_many :users, through: :members

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
