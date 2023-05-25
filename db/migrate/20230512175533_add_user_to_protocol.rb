class AddUserToProtocol < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :protocol, null: false, foreign_key: true
  end
end
