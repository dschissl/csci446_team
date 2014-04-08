json.array!(@considered_items) do |considered_item|
  json.extract! considered_item, :id, :pet_id, :consideration_id
  json.url considered_item_url(considered_item, format: :json)
end
