require 'rails_helper'
require './app/facades/protocol_facade'

RSpec.describe PsydiaryFacade do
  describe '.class_methods' do
    context '#initialize' do 
      let(:facade) { described_class.new }

      it 'exists' do
        expect(facade).to be_a(PsydiaryFacade)
      end

      it 'has attributes' do 
        expect(facade.params).to be_a(Hash)
      end
    end
  end

  describe '.instance_methods' do
    context '.new_user' do

    end
    
    context '.edit_user' do 
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
      let(:facade) { described_class.new(user_id) }
  
      before do
        stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/#{user_id}/settings")
        .to_return(status: 200, body: expected_response_body.to_json)
      end

      it 'can get user info to render edit page for that user' do
        user_to_edit = facade.edit_user

        expect(user_to_edit).to be_a(UserEdit)
        expect(user_to_edit.data_sharing).to eq(true)
        expect(user_to_edit.email).to eq("someone@something.com")
        expect(user_to_edit.id).to eq(1)
        expect(user_to_edit.name).to eq("Someone Something")
        expect(user_to_edit.protocol_id).to eq(1)
        expect(user_to_edit.protocol_name).to eq("protocol_name")
      end
    end
    
    context '.update_user' do
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
    end
  end
end