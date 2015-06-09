json.array!(@orders) do |order|
  json.extract! order, :id, :order_date, :total_discount, :sub_total, :igv, :total, :local_id, :user_id, :payment_type_id
  json.url order_url(order, format: :json)
end
