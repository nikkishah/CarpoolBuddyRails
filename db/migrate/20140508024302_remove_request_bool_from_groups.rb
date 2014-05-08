class RemoveRequestBoolFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :request_bool, :boolean
  end
end
