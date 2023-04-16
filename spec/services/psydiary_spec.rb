require 'rails_helper'

RSpec.describe PsydiaryService do
  describe 'class methods' do
    describe '.create_user' do
      it 'creates a new user' do
        user1 = {
            name: Faker::Name.name,
            email: Faker::Internet.unique.email,
            ip_address: "192.199.248.75",
            data_sharing: Faker::Boolean.boolean,
            password: Faker::Internet.password,
            protocol_id: 4
          }
        user = PsydiaryService.create_user(user1)
        expect(user.status).to eq(201)
        
        response = JSON.parse(user.body, symbolize_names: true)
        # require 'pry'; binding.pry
        expect(response[:data][:attributes][:name]).to eq(user1[:name])
        expect(response[:data][:attributes][:email]).to eq(user1[:email])
        expect(response[:data][:attributes][:data_sharing]).to eq(user1[:data_sharing])
        expect(response[:data][:attributes][:protocol_id]).to eq(user1[:protocol_id])
      end
    end
  end
end