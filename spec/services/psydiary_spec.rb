require 'rails_helper'

RSpec.describe PsydiaryService do
  describe 'class methods' do
    describe '.create_user' do
      it 'creates a new user' do
        user1 = FactoryBot.build(:user, ip_address: "192.199.248.75")
        
        user = PsydiaryService.create_user(name: user1.name, protocol_id: 1, email: user1.email, password: "password", data_sharing: "Yes", ip_address: user1.ip_address)
        expect(user.status).to eq(201)
        
        response = JSON.parse(user.body, symbolize_names: true)
        
        expect(response[:data][:attributes][:name]).to eq(user1.name)
        expect(response[:data][:attributes][:email]).to eq(user1.email)
        expect(response[:data][:attributes][:data_sharing]).to eq(true)
        # expect(response[:data][:attributes][:ip_address]).to eq(user1.ip_address)
        # expect(response[:data][:attributes][:protocol_id]).to eq(user1.protocol_id)
        # expect(response[:data][:attributes][:password]).to eq(user1.password)
      end
    end
  end
end