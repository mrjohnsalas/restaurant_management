json.array!(@menus) do |menu|
  json.extract! menu, :id, :menu_date, :stock, :local_id, :item_id
  json.url menu_url(menu, format: :json)
end
