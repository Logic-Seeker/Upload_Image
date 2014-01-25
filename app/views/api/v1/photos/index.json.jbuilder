json.array!(@photo) do |json, thing|
  json.id thing.id
  json.title thing.title
  json.image_url thing.image
end
