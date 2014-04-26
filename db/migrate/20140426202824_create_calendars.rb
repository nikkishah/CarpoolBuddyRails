class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
