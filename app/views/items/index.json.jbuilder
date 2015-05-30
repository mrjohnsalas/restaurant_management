json.array!(@items) do |item|
  json.extract! item, :id, :name, :unit_cost, :unit_price, :restaurant_id, :item_category_id, :food_category_id, :object_type_id
  json.url item_url(item, format: :json)
end
