json.array!(@locals) do |local|
  json.extract! local, :id, :name, :phone_1, :phone_2, :email_1, :email_2, :description, :allow_delivery, :allow_parking, :allow_reservation, :allow_credit_card, :restaurant_id, :district_id
  json.url local_url(local, format: :json)
end
