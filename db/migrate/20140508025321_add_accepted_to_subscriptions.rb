class AddAcceptedToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :accepted, :boolean
  end
end
