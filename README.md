# README

## アプリケーション名
IzakayaRecipe

## :link: アプリケーションの概要
<ul>
  <li>居酒屋メニューに特化したレシピサイトです。</li>
</ul>

## App URL
<ul>
  <li>https://izakaya-recipe.herokuapp.com/</li>
</ul>

## テスト用アカウント
<ul>
  <li>ニックネーム  test1</li>
  <li>パスワード  aaa111</li>
</ul>

## 利用方法
<ul>
  <li>トップページからゲストログイン（閲覧用）をクリック</li>
  <li>「レシピを見てみる」または「材料を探してみる」をクリックし、一覧画面へ遷移します</li>
  <li>レシピのお気に入り登録やフォローすることが可能です（要ログイン）</li>
</ul>

## :package: 使用技術
- フロントエンド
    - jQuery 1.12.4
    - HTML/CSS/Haml/Sass
- バックエンド
    - ruby 2.6.5
    - Ruby on Rails 6.0.0
- インフラ
    - nginx 1.12.2
    - mysql 5.7.31
    - AWS ( EC2, ALB, ACM, RDS, Route53, VPC, IAM )
- その他使用ツール
    - Visual Studio Code
    - draw.io

## :key: AWS構成図
![aws](https://user-images.githubusercontent.com/66116053/105630353-0b1fd500-5e8c-11eb-9b5e-c02ae3471b3f.png)

# DB設計

## ER図
![database](https://raw.githubusercontent.com/shisoshiso/izakaya-recipe/master/ER.png)

## 各テーブルについて

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

## ローカルでの動作方法
<ul>
  <li>git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述しましょう。この時、アプリケーション開発に使用した環境を併記することを忘れないでください（パッケージやRubyのバージョンなど）</li>
</ul>