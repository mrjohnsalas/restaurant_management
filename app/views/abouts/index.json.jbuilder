json.array!(@abouts) do |about|
  json.extract! about, :id, :history, :mision, :vision
  json.url about_url(about, format: :json)
end
