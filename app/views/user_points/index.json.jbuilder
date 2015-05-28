json.array!(@user_points) do |user_point|
  json.extract! user_point, :id, :quantity, :restaurant_id, :user_id
  json.url user_point_url(user_point, format: :json)
end
