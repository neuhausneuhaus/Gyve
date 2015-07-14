class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :card_type
      t.datetime "card_start_date"
      t.float :cost, default: 0, :scale =>2
      t.float :funds_raised, default: 0, :scale =>2
      t.string :status
    end
  end
end
