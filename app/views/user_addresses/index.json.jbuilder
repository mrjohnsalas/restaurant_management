json.array!(@user_addresses) do |user_address|
  json.extract! user_address, :id, :name, :address, :is_default, :district_id, :user_id
  json.url user_address_url(user_address, format: :json)
end
