require 'rails_helper'
require './app/facades/protocol_facade'

RSpec.describe PsydiaryFacade do
  describe '.class_methods' do
    context '#intitialize' do 
      before do
        @new_user_params = {
          "name"=>"Emerita Kessler", 
          "email"=>"ricarda@kuvalis-mckenzie.biz", 
          "password"=>"password", 
          "protocol_id"=>"4", 
          "ip_address"=>"192.199.248.75", 
          "data_sharing"=>"False"
        }
      end

      it 'has attributes' do 
        facade = PsydiaryFacade.new(@new_user_params)

        expect(facade.params).to eq(@new_user_params)
      end
    end
  end

  describe '.instance_methods' do
    context 'edit_user' do 
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

      it 'can get user info to render edit page for that user' do
        facade = PsydiaryFacade.new(@user_edit_params)
        require 'pry'; binding.pry
        expect(facade.edit_user)
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