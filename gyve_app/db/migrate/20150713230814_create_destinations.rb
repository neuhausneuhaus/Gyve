class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :destination, null: false

      t.integer :client_id, null: false
    end
  end
end
