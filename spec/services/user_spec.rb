require 'rails_helper'

RSpec.describe UserService do
  describe 'class methods' do
    describe '.create_user' do
      it 'creates a new user' do
        attributes = {:name=>"Caridad Herzog CPA",
          :email=>"caridad_cpa_herzog@davis.example",
          :password=>"pG6SUJxArr",
          :data_sharing=>true,
          :protocol_id=>55,
          :ip_address=>"2601:282:4300:aef0:3c11:257d:152b:f5ad"}

        user = UserService.create_user(attributes)
        require 'pry'; binding.pry
        expect(response.status).to eq(200)
      end
    end
  end
end