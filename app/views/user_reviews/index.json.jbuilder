json.array!(@user_reviews) do |user_review|
  json.extract! user_review, :id, :rating, :comment, :object_type_id, :user_id, :item_id, :restaurant_id
  json.url user_review_url(user_review, format: :json)
end
