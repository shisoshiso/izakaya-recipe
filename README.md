# README

## アプリケーション名
<ul>
  <li>居酒屋レシピ</li>
</ul>

## アプリケーションの概要
<ul>
  <li>居酒屋メニューに特化したレシピサイトです。</li>
</ul>

## 使用技術
- フロントエンド
    - HTML/CSS/Haml/Sass
    - Bootstrap4
- バックエンド
    - ruby 2.6.5
    - Ruby on Rails 6.0.3
- インフラ
    - MySQL2
    - AWS ( S3 )
    - Heroku
- その他使用ツール
    - Visual Studio Code
    - draw.io

## App URL
<ul>
  <li>https://izakaya-recipe.herokuapp.com/</li>
</ul>

## テスト用アカウント
```HTML
ユーザー名：test1
パスワード：aaa111
```
※ページ内には「ゲストログイン（テストユーザーとしてワンクリックでログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。

## 利用方法
<ul>
  <li>トップページからゲストログイン（閲覧用）をクリック</li>
  <li>検索欄からレシピを調べることができます。また、トップページ右側の詳細検索欄から、カテゴリ検索他、複雑な検索が可能です。</li>
  <li>レシピのお気に入り登録やユーザーをフォローすることが可能です</li>
</ul>

## 目指した課題解決
<ul>
  <li>この社会情勢で居酒屋に行けない人達のために、お家で少しでも居酒屋気分を味わってもらえたらという思いで、開発しました。</li>
  <li>緊急事態宣言下で、ストレス解消に家でお酒を嗜む人や、普段料理しない人も料理するようになっているのではないでしょうか。そのような方達をターゲットとしています。</li>
  <li>現在、既存の有名なレシピサイトは、主婦層を狙っており、居酒屋メニューは数が少なかったり、酒飲みからすると味付けが薄めのレシピが多いです。</li>
  <li>そのため、必死で作った料理が失敗した。また、お酒に合うレシピを探すのが大変だと、料理へのハードルが上がってしまいます。</li>
  <li>簡単にお酒に合うレシピサイトを開発すれば、上記のような課題を開発できると思い、開発に至りました。</li>
</ul>

## 洗い出した要件(使用したgem名)
- 詳細検索機能(ransack)
- 投稿機能(Activehash)
- 一覧表示機能
- ページネーション機能(kaminari)
- 詳細表示機能
- 編集、削除機能
- ユーザー管理機能(devise)
- 簡単ログイン機能
- エラーメッセージ日本語化機能(rails-i18n)
- いいね機能
- いいね順並替え機能
- コメント機能
- パンくずリスト表示機能(gretel)
- 画像プレビュー機能
- 静的ページ作成(high_voltage)

## 実装した機能についてのGIFと説明
- 簡単ログイン機能
ユーザー登録せずに、ゲストとして本アプリを簡単に使用できます。
例）未ログイン状態では、ユーザー詳細ページへ遷移できずにログイン画面へ遷移します。ゲストログインを選択することで、ユーザー詳細画面へ遷移することができます。
![izakayarecipe1](https://i.gyazo.com/53e765f26d30016796c024a14c8f06ff.gif)

- 新規レシピ投稿機能
ログインしたユーザーは新規投稿することができます。
![izakayarecipe2](https://i.gyazo.com/2b1e2bb091daff57d8ad8b563c2058d1.gif)

- いいね機能
気に入ったレシピにいいねすることができます。
![izakayarecipe3](https://i.gyazo.com/fbc46fb1e5367fed5db24cffff812b0c.gif)

- いいね順並べ替え機能
いいね順に並んでいるので、人気レシピがわかります。
![izakayarecipe4](https://i.gyazo.com/eb2e43d4c192d0d41938b0c1805869da.gif)

- 詳細検索機能
カテゴリ別に検索することができます。
![izakayarecipe5](https://i.gyazo.com/7a3cf5738e97bac39b457b26210076dd.gif)

- エラーメッセージ日本語化機能
新規投稿画面およびログイン画面でのエラーメッセージを日本語で表示します。
![izakayarecipe6](https://i.gyazo.com/e8d9eee0a0eafaa9c649233bc76bd388.gif)


## 実装予定の機能
- AWS　EC２へのデプロイ
- レスポンシブデザイン
- いいね、コメント機能のAjax化
- SNS認証用API
- CircleCIの導入
- 材料・手順DBの再設計
- コメントに画像添付（つくれぽ）


## 実装を通しての反省点
- 単なる居酒屋レシピを集めただけのレシピサイトになってしまった。
- なぜそうなってしまったのか：要件定義、設計（上流工程）を行わず、開発しながら進めたため。結果、機能を多く実装したものの、居酒屋レシピを食べたい人たちにとって、改善を与える機能がない。
- なぜ開発しながら進めたのか：学習を兼ねており、多機能にすることも目的の一つであったため（ユーザー＜自身）。期限が迫っていて、焦りがあったため。
- どうすれば改善できるのか：上流工程を踏まえた上で、開発に進む。
- 学んだこと：上流工程の重要性。上流工程を明確かつ細部まで設計しておくことで、工数を最小限にすることができ（迷いがなくなるため）、ユーザーにとって、有益なアプリになる。

## データベース設計

### ER図
![database](https://raw.githubusercontent.com/shisoshiso/izakaya-recipe/master/ER.png)

### 各テーブルについて

#### users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| encrypted_password | string | null: false               |

##### Association

- has_many :recipes
- has_many :comments
- has_many :favorites
- has_many :favorite_recipes, through: :favorites, source: :recipe
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user


#### relationships テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| follow | references | null: false, foreign_key: true |

##### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'


#### recipes テーブル

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

##### Association

- belongs_to :user
- has_many :comments
- has_many :recipe_images
- has_many :favorites


#### recipe_images テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| src    | string     | null: false                    |
| recipe | references | null: false, foreign_key: true |

##### Association

- belongs_to :recipe


#### comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

##### Association

- belongs_to :user
- belongs_to :recipe
- has_many :comment_images


#### comment_images テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| src     | string     | null: false                    |
| comment | references | null: false, foreign_key: true |

##### Association

- belongs_to :comment


#### favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| recipe | references | null: false, foreign_key: true |

##### Association

- belongs_to :user
- belongs_to :recipe

## ローカルでの動作方法
<ul>
  <li>git cloneから、ローカルで動作させるまでに必要なコマンドを記述しています。
  <li>git clone izakaya-recipe</li>
  <li>cd アプリケーションのディレクトリ</li>
  <li>bundle install</li>
  <li>yarn install</li>
  <li>rails db:create</li>
  <li>rails db:migrate</li>
  <li>rails s</li>
</ul>
