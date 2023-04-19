require 'rails_helper'

RSpec.describe UserEdit do
  describe 'initialize' do
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

      @user_edit = PsydiaryFacade.new(user_id: user_id).edit_user
    end

    it 'exists' do
      expect(@user_edit).to be_a(UserEdit)
    end

    it 'has attributes, readable' do
      expected_attributes = expected_response_body[:data][:attributes]

      expect(@user_edit.id).to eq(user_id.to_i)
      expect(@user_edit.name).to eq(expected_attributes[:name])
      expect(@user_edit.email).to eq(expected_attributes[:email])
      expect(@user_edit.protocol_id).to eq(expected_attributes[:protocol][:id].to_i)
      expect(@user_edit.protocol_name).to eq(expected_attributes[:protocol][:name])
      expect(@user_edit.data_sharing).to eq(expected_attributes[:data_sharing])
    end
  end
end