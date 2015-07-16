class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.float :amount, default: 0, :scale =>2, null: false
      t.timestamps null: false

      t.integer :donor_id, null: false
      t.integer :client_id, null: false
      t.integer :goal_id, null: false
    end
  end
end
