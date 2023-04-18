# require 'faker'

# FactoryBot.define do
#   factory :user do
#     name { Faker::Name.name }
#     email { Faker::Internet.unique.email }
#     password { Faker::Internet.password }
#     data_sharing { Faker::Boolean.boolean }
#     initialize_with { new(attributes) }
#   end
# end