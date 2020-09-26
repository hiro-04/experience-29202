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

### テーブル設計		
		
## users テーブル
		
| Column                | Type   | Options      |
| -------               | -----  | ------------ |
| first_name            | string | null: false  |
| family_name           | string | null: false  |
| first_name_kana       | string | null: false  |
| family_name_kana      | string | null: false  |
| email                 | string | null: false  |
| password              | string | null: false  |
| birthday              | date   | null: false  |
		
### Association
		
-has_many :articles
-has_many :comments
-has_many :likes
		
## articleテーブル
		
| Column       | Type       | Options                           |
| -------      | -----      | ------------                      |
| title        | string     | null: false                       |
| content      | text       | null: false                       |
| category     | integer    | null: false                       |
| user         | references | null: false, foreign_key: true    |


### Association
		
-belongs_to:user
-has_many :comments
-has_many :likes
	
		
### commentsテーブル
		
| Column           | Type        | Options                         |
| -------          | -----       | ------------                    |
| user             | references  | null: false  foreign_key: true  |
| item             | references  | null: false  foreign_key: true  |
		
### Association
-belongs_to:user
-belongs_to:item


### likesテーブル

| Column           | Type        | Options                         |
| -------          | -----       | ------------                    |
| user             | references  | null: false  foreign_key: true  |
| item             | references  | null: false  foreign_key: true  |

### Association
-belongs_to:user
-belongs_to:item