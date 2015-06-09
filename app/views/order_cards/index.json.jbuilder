json.array!(@order_cards) do |order_card|
  json.extract! order_card, :id, :order_id, :user_card_id
  json.url order_card_url(order_card, format: :json)
end
