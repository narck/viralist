json.array!(@contacts) do |contact|
  json.extract! contact, :id, :fname, :lname, :phone, :email, :company_id
  json.url contact_url(contact, format: :json)
end
