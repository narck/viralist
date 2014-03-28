json.array!(@stores) do |store|
  json.extract! store, :id, :name, :company_id, :contact_id
  json.url store_url(store, format: :json)
end
