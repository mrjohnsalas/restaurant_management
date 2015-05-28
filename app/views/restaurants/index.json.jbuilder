json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :phone_1, :phone_2, :email_1, :email_2, :web_page, :facebook, :twitter, :instagram, :allow_point, :min_points, :user_id, :object_type_id
  json.url restaurant_url(restaurant, format: :json)
end
