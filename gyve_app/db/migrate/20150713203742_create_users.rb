class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :type

      t.string :f_name, null: false
      t.string :l_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
      
      t.float :funds_remaining, default: 0, :scale =>2
      t.float :funds_spent, default: 0, :scale =>2

      t.string :agency, default: nil

    end
  end
end
