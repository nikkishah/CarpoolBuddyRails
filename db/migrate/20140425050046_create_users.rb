class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
