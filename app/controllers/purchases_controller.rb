class PurchasesController < ApplicationController
  require 'payjp'

  def index
    
    card = Card.where(user_id: current_user.id).first
    @user = current_user
    @address = Address.where(user_id: current_user.id).first
    @profile = Profile.find(current_user.id)
    @item = Item.find(params[:item_id])
  
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:item_id])
    @item.update(buyer_id: current_user.id)
    @item.update(trading_status: "売り切れ")
  
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id, #顧客ID
    currency: 'jpy', #日本円
    )
   
    redirect_to action: 'done' #完了画面に移動
    
  end

  def done
    @item = Item.find(params[:item_id])

    card = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
  end
end

