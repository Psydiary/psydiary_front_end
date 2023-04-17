require 'rails_helper'

RSpec.describe User do
  before :each do
    user_info = {data: {
      id: "1",
      attributes: {
        id: 1,
        name: "Tori Enyart",
        email: "torienyart@gmail.com",
        data_sharing: true,
        protocol_id: "1"
      }}
    }

    @user = User.new(user_info)
  end

  it 'exists' do
    expect(@user).to be_a(User)
    expect(@user.id).to eq("1")
    expect(@user.name).to eq("Tori Enyart")
    expect(@user.email).to eq("torienyart@gmail.com")
    expect(@user.data_sharing).to eq(true)
    expect(@user.protocol_id).to eq("1")
  end

  it "can pull a user's first name" do
    expect(@user.first_name).to eq("Tori")
  end
end