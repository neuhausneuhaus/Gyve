class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :f_name, null: false
      t.string :l_name, null: false
      t.timestamps null: false
      t.string :gender
      t.string :client_alias
      t.text :about
      t.integer :zip, null: false

      t.integer :progress, default: 0

      t.integer :caseworker_id

    end
  end
end
