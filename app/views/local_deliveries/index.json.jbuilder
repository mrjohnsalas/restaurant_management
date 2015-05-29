json.array!(@local_deliveries) do |local_delivery|
  json.extract! local_delivery, :id, :start_time, :end_time, :local_id, :district_id
  json.url local_delivery_url(local_delivery, format: :json)
end
