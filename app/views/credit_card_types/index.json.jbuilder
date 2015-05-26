json.array!(@credit_card_types) do |credit_card_type|
  json.extract! credit_card_type, :id, :name
  json.url credit_card_type_url(credit_card_type, format: :json)
end
