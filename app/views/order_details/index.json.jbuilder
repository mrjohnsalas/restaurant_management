json.array!(@order_details) do |order_detail|
  json.extract! order_detail, :id, :quantity, :unit_price, :total, :order_id, :menu_id
  json.url order_detail_url(order_detail, format: :json)
end
