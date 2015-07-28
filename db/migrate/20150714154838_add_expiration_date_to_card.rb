class AddExpirationDateToCard < ActiveRecord::Migration
  def change
    add_column :cards, :expiration_date, :datetime
  end
end
