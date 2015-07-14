class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.float :amount, default: 0, :scale =>2, null: false
      t.timestamps null: false
    end
  end
end
