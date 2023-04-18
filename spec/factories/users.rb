FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email(name: name) }
    password { Faker::Internet.password }
    password_confirmation { password }
    protocol_id { create(:protocol).id }
    data_sharing { Faker::Boolean.boolean}
  end
end