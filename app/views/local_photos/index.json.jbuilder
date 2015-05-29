json.array!(@local_photos) do |local_photo|
  json.extract! local_photo, :id, :index, :local_id
  json.url local_photo_url(local_photo, format: :json)
end
