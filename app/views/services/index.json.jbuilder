json.array!(@services) do |service|
  json.extract! service, :name, :title, :description, :picture_url
  json.url service_url(service, format: :json)
end
