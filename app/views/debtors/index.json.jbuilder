json.array!(@debtors) do |debtor|
  json.extract! debtor, :title, :content
  json.url debtor_url(debtor, format: :json)
end
