FactoryGirl.define do
  sequence :description, aliases: [:question] do
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
end
