require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    describe '.create_user' do
      it 'creates a new user' do
        attributes = {
          name: "Caridad Herzog CPA",
          email: "caridad_cpa_herzog@davis.example",
          password: "pG6SUJxArr",
          data_sharing: true,
          protocol_id: 1,
          ip_address: "192.199.248.75"
        }

        user = UserService.create_user(attributes)
        # require 'pry'; binding.pry
        expect(user.status).to eq(201)
        # expect(user.name).to eq(attributes[:name])
      end
    end
  end
end