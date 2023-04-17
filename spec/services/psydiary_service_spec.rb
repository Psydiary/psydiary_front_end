require 'rails_helper'

RSpec.describe PsydiaryService do
  describe 'class methods' do
    before do
      @original_password = Faker::Internet.password
    end
    
    context '.create_user' do
      describe 'happy path' do
        before do
          @request_params = {
            "name": "Kyra D'Amore",
            "email": Faker::Internet.email,
            "password": @original_password,
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

    context ".edit_user" do
      describe 'happy path' do
        let(:user_id) { '1' }
        let(:expected_response_body) do
          {
            data: {
              id: user_id,
              type: 'user',
              attributes: {
                name: 'Someone Something',
                email: 'someone@something.com',
                protocol: {
                  id: '1',
                  name: 'protocol_name'
                },
                data_sharing: 'true'
              }
            }
          }
        end
  
        before do
          stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/#{user_id}/settings")
          .to_return(status: 200, body: expected_response_body.to_json)
        end
    
        it 'returns the expected user info' do
          response = PsydiaryService.edit_user(user_id)
          expect(response.status).to eq(200)
          expect(JSON.parse(response.body, symbolize_names: true)).to eq(expected_response_body)
        end
      end
    end
  end
end