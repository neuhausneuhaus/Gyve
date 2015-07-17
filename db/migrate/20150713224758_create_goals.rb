class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :card_type
      t.datetime "card_start_date"
      t.decimal :cost, default: 0, :scale =>2, :precision =>7
      # t.decimal :funds_raised, default: 0, :scale =>2
      t.string :status

      t.integer :client_id, null: false

    end
  end
end
