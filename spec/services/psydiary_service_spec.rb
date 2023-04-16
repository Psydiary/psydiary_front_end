require 'rails_helper'

RSpec.describe PsydiaryService do
  describe 'class methods' do
    context '.create_user' do

      before do
        @request_params = {
              "name": "Kyra D'Amore",
              "email": Faker::Internet.email,
              "password": Faker::Internet.password,
              "ip_address": "76.131.159.186",
              "protocol_id": 1, 
              "data_sharing": false 
            }
      end

      it 'creates a new user' do
        VCR.use_cassette('psydiary_service/new_user', record: :once) do
          user = PsydiaryService.create_user(@request_params)
          
          expect(new_user.status).to eq(201)
          
          response = JSON.parse(user_new.body, symbolize_names: true)
          require 'pry'; binding.pry
          expect(response[:data][:attributes][:name]).to eq(user1[:name])
          expect(response[:data][:attributes][:email]).to eq(user1[:email])
          expect(response[:data][:attributes][:data_sharing]).to eq(user1[:data_sharing])
          expect(response[:data][:attributes][:protocol_id]).to eq(user1[:protocol_id])
        end
      end
    end
  end
end