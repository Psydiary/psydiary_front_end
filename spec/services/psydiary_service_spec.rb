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
          response = PsydiaryService.create_user(@request_params)
          
          expect(response.status).to eq(201)
          
          parsed = JSON.parse(response.body, symbolize_names: true)

          data = parsed[:data]
          attributes = data[:attributes]

          expectation = Proc.new do |example, data_type|
            expect(example).to be_a(data_type)
          end

          expectation.call(data[:id], String)
          expectation.call(data[:type], String)
          expectation.call(data[:attributes], Hash)
          
          expectation.call(attributes[:name], String)
          expectation.call(attributes[:email], String)
          expectation.call(attributes[:protocol_id], Integer)
          expect(attributes[:data_sharing]).to be_a(FalseClass).or be_a(TrueClass)
        end
      end
    end
  end
end