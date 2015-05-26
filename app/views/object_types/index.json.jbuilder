json.array!(@object_types) do |object_type|
  json.extract! object_type, :id, :name
  json.url object_type_url(object_type, format: :json)
end
