class AddBooleanToGroups < ActiveRecord::Migration
  def change
  	add_column :groups, :request_bool, :boolean
  end
end
