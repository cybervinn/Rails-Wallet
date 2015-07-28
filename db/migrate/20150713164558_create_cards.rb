class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :number
      t.string :type
      t.integer :expiration_month
      t.integer :expiration_year

      t.timestamps
    end
  end
end
