json.array!(@type_of_products) do |type_of_product|
  json.extract! type_of_product, :name, :title, :description, :picture_url
  json.url type_of_product_url(type_of_product, format: :json)
end
