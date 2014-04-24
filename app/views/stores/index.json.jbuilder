json.array!(@stores) do |store|
  json.extract! store, :id, :name

  json.company do
  	json.name store.company.name
  end
  json.contact do
  	json.name store.contact.to_s
  end  
  json.last do
  	json.visited store.last_visited
  end
  json.threshold do
    json.value store.threshold
    json.exceeded store.threshold_exceeded
    json.nearing store.nearing_threshold
  end
end

