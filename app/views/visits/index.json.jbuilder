json.array!(@visits) do |visit|
  json.extract! visit, :id, :visitdate
  json.days do
  	json.since visit.days_since
  end
  json.user do
    json.id visit.user.id
    json.name visit.user.realname
  end
  json.store do
    json.id visit.store.id
    json.name visit.store.to_s
  end
end