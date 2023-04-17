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

    context ".user_settings" do
      describe 'happy path' do
        before do
          VCR.use_cassette('psydiary_service/new_user', record: :once) do
            response = PsydiaryService.create_user(@request_params)
            @parsed_create = JSON.parse(response.body, symbolize_names: true)
          end
          
          new_password = Faker::Internet.password
          @user_attributes = @parsed_create[:data][:attributes]

          @user_request_params = {
            "user_id": @parsed_create[:data][:id]
          }

          @update_request_params = {
            "name": @user_attributes[:name],
            "user_id": @parsed_create[:data][:id],
            "email": @user_attributes[:email],
            "old_password": @original_password,
            "new_password": new_password,
            "password_confirm": new_password,
            "protocol_id": @user_attributes[:protocol_id], 
            "data_sharing": @user_attributes[:data_sharing]
          }
        end

        it 'can get send user info to render edit page fo that user' do
          VCR.use_cassette('psydiary_service/get_user') do
            response = PsydiaryService.get_user(@user_request_params)
            require 'pry'; binding.pry
            @parsed_get = JSON.parse(response.body, symbolize_names: true)

          end
        end

        xit 'can get send user info to render edit page fo that user' do
          VCR.use_cassette('psydiary_service/user_settings') do
            response = PsydiaryService.user_settings(@update_request_params)
            require 'pry'; binding.pry
          end
        end
      end
    end
  end
end