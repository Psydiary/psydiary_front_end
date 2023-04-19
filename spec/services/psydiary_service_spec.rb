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
            name: 'Kyra DAmore',
            email: Faker::Internet.email,
            password: @original_password,
            ip_address: '76.131.159.186',
            protocol_id: 1, 
            data_sharing: false 
          }
        end

        it 'creates a new user' do
          VCR.use_cassette('psydiary_service_spec/new_user', record: :once) do
            response = PsydiaryService.create_user(@request_params.to_json)
            
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
                data_sharing: true
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

    context '.authenticate_user', :vcr do
      before do
        @login_request_params = { "email": "bobbyluly@gmail.com", "password": "5678" }
      end

      it "authenticates a user's email and password" do
        login_response = PsydiaryService.authenticate_user(@login_request_params)

        expect(login_response).to be_a(Hash)
        expect(login_response[:data].keys).to eq([:id, :type, :attributes])
        expect(login_response[:data][:id]).to be_a(String)
        expect(login_response[:data][:id].to_i).to eq(2)
        expect(login_response[:data][:type]).to eq('user')
        expect(login_response[:data][:attributes].keys).to eq([:name, :email, :protocol_id, :data_sharing])
        expect(login_response[:data][:attributes][:name]).to eq('Bobby Luly')
        expect(login_response[:data][:attributes][:email]).to eq("bobbyluly@gmail.com")
      end
    end

    it '.get_entries', :vcr do
      entry_response = PsydiaryService.get_entries(2)

      parsed = JSON.parse(entry_response.body, symbolize_names: true)

      expect(parsed).to be_a(Hash)
      
      expect(parsed[:data].first.keys).to eq([:id, :type, :attributes])
      expect(parsed[:data].first[:id]).to be_a(String)
      expect(parsed[:data].first[:type]).to eq('user_entry')
      expect(parsed[:data].first[:attributes]).to be_a(Hash)
      expect(parsed[:data].first[:attributes].keys).to eq([:id ,:user_id, :created_at, :updated_at, :type, :sociability, :mood, :depression_score, :anxiety_score, :sleep_score, :exercise, :meditation, :energy_levels, :notes])
      expect(parsed[:data].first[:attributes][:id]).to be_a(Integer)
      expect(parsed[:data].first[:attributes][:user_id]).to be_a(Integer)
      expect(parsed[:data].first[:attributes][:created_at]).to be_a(String)
      expect(parsed[:data].first[:attributes][:updated_at]).to be_a(String)
      expect(parsed[:data].first[:attributes][:type]).to be_a(String)
      expect(parsed[:data].first[:attributes][:sociability]).to be_a(String)
      expect(parsed[:data].first[:attributes][:mood]).to be_a(String)
      expect(parsed[:data].first[:attributes][:depression_score]).to be_a(Integer)
      expect(parsed[:data].first[:attributes][:anxiety_score]).to be_a(Integer)
      expect(parsed[:data].first[:attributes][:sleep_score]).to be_a(Integer)
      expect(parsed[:data].first[:attributes][:exercise]).to be_a(String)
      expect(parsed[:data].first[:attributes][:meditation]).to be_a(String)
      expect(parsed[:data].first[:attributes][:energy_levels]).to be_a(Integer)
      expect(parsed[:data].first[:attributes][:notes]).to be_a(String)
      expect(parsed[:data].count).to eq(4)
    end
  end
end