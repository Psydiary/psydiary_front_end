require 'rails_helper'

RSpec.describe PsydiaryFacade do
  let(:login_request_params) {{ email: "bobbyluly@gmail.com", password: "5678" }}
  let(:login_facade) { described_class.new(login_request_params)}

  describe "authenticate_user", :vcr do
    it 'returns a user object when a user logs in successfully' do
      logged_in_user = login_facade.authenticate_user

      expect(logged_in_user).to be_a(User)
      expect(logged_in_user.id).to eq("2")
      expect(logged_in_user.name).to eq('Bobby Luly')
      expect(logged_in_user.email).to eq('bobbyluly@gmail.com')
      expect(logged_in_user.protocol_id).to eq(2)
      expect(logged_in_user.data_sharing).to eq(true)
    end
  end
end
