class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :group_id

      t.timestamps
    end
  end
end
