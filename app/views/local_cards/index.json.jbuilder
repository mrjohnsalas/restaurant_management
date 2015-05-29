json.array!(@local_cards) do |local_card|
  json.extract! local_card, :id, :local_id, :credit_card_type_id
  json.url local_card_url(local_card, format: :json)
end
