json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :pet_type, :age, :description, :image_url
  json.url pet_url(pet, format: :json)
end
