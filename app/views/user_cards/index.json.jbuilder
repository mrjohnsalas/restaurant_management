json.array!(@user_cards) do |user_card|
  json.extract! user_card, :id, :card_number, :is_default, :credit_card_type_id, :user_id
  json.url user_card_url(user_card, format: :json)
end
