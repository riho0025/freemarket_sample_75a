# フリーマーケットアプリ
TECH::CAMP受講中に４人チームで開発しました。  
  
# DEMO
<img width="1292" alt="スクリーンショット 2020-06-10 10 43 35" src="https://user-images.githubusercontent.com/63936582/84217626-98820500-ab07-11ea-9be4-80335dcb8f96.png">  
  
# Features
・ユーザーの新規登録、ログイン機能があります。  
・商品の出品、画像の添付、出品後の情報の編集、削除、商品の購入が可能です。  
・クレジットカードの登録が可能です。  
・商品詳細ページにてコメント、お気に入り機能があります。  
  
  
# Role
・DB設計  
*フロントエンド  
  ・ユーザーマイページ  
  ・商品出品ページ  
  ・商品情報編集ページ  
  ・商品詳細ページ  
  ・商品購入確認ページ  
  ・商品についての質問・コメント機能  
  ・商品のお気に入り機能  
*バックエンド  
  ・ユーザーマイページ  
  ・商品出品ページ  
  ・商品情報編集ページ  
  ・商品詳細ページ  
  ・ 商品購入機能  
  ・商品についての質問・コメント機能  
  ・商品のお気に入り機能  

# URL
 [http://18.181.47.13/](http://18.181.47.13/)  
  
  
  
# データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :items
- has_many :comments
- has_one :profile
- has_one :creditcard

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|introduction|text||
|icon|string||
|phone_number|integer|null: false|
|birthday|integer|null: false|
|user|references|null: false|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|apartment|string||
|user|references|null: false

### Association
- belongs_to :user

## creditcardテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false|
|customer_id|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|description|text|null: false|
|price|integer|null: false|
|status|string|null: false|
|size|string||
|trading_status|string|null: false|
|delivery_area|string|null: false|
|delivery_days|string|null: false|
|delivery_burden|string|null: false|
|user|references|null: false, foreign_key: true|
|brand|references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :categoty
- belongs_to :brand
- has_many :comments


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false|

### Association
- belongs_to :item

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|


### Association
- has_many :items

## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|


### Association
- has_many :items

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string||
|delete_check|integer|default: 0|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belings_to :user
- belings_to :item