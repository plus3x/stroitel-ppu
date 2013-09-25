json.array!(@products) do |product|
  json.extract! product, :name, :title, :description, :picture_url
  json.url product_url(product, format: :json)
end
