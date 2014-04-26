class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :highschool
      t.string :sex
      t.string :grade
      t.string :passcode

      t.timestamps
    end
  end
end
