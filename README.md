# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :recipes
- has_many :comments
- has_many :favorites
- has_many :favorite_recipes, through: :favorites, source: :recipe
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user


## relationships テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| follow | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'


## recipes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| material    | text       | null: false                    |
| alcohol_id  | integer    | null: false                    |
| category_id | integer    | null: false                    |
| genre_id    | integer    | null: false                    |
| explanation | text       | null: false                    |
| point       | text       |                                |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :recipe_images
- has_many :favorites


## recipe_images テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| src    | string     | null: false                    |
| recipe | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe


## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe
- has_many :comment_images


## comment_images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| src     | string     | null: false                    |
| comment | references | null: false, foreign_key: true |

### Association

- belongs_to :comment


## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe