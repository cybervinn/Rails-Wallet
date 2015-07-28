class ChangeDefaultForUsersBalance < ActiveRecord::Migration
  def change
    change_column :users, :balance, :decimal, default: 0.0
  end
end
