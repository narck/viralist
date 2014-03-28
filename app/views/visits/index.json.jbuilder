json.array!(@visits) do |visit|
  json.extract! visit, :id, :visitdate, :note, :user_id, :store_id
  json.url visit_url(visit, format: :json)
end
