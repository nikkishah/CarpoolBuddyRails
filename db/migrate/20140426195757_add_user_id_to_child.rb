class AddUserIdToChild < ActiveRecord::Migration
  def change
    add_column :children, :user_id, :integer
    add_column :children, :school_id, :integer
  end
end
