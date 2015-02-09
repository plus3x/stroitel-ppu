FactoryGirl.define do
  sequence :description, aliases: [:question, :content] do
    ('A'..'z').to_a.*(10).sample(255).join
  end
  sequence(:name, aliases: [:person]) { |n| "John##{n}" }
  sequence(:email) { |n| "john#{n}@mail.com" }

  factory :user do
    name
    password 'secret'
    password_confirmation { password }
    trait(:admin  ) { role 'Role::Admin'   }
    trait(:manager) { role 'Role::Manager' }
  end

  factory :service do
    sequence(:name) { |n| "Service##{n}" }
  end

  factory :order do
    email
    description
  end

  factory :debtor do
    sequence(:title) { |n| "Debtor##{n}" }
    content
  end

  factory :type_of_product do
    sequence(:name)  { |n| "TypeOfProduct##{n}" }
    sequence(:title) { |n| "TypeOfProduct##{n}" }
    description
  end

  factory :product
  factory :seo_meta
end
