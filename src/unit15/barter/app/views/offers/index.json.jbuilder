json.array!(@offers) do |offer|
  json.extract! offer, :id, :message
  json.url offer_url(offer, format: :json)
end
