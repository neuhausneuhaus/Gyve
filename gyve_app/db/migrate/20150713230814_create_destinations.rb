class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :destination, null: false
    end
  end
end
