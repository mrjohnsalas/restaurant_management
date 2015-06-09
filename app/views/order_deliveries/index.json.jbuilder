json.array!(@order_deliveries) do |order_delivery|
  json.extract! order_delivery, :id, :order_id, :user_address_id
  json.url order_delivery_url(order_delivery, format: :json)
end
