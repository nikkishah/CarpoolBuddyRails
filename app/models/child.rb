class Child < ActiveRecord::Base
	has_many :families
	has_many :users, through: :families

	def add_child_to_user_helper(user_id)
		user = User.find_by_id(user_id)
		self.users << user
		self.save
	end

	def remove_child_from_user_helper(user_id)
		user = User.find_by_id(user_id)
		self.users.delete(user)
		self.save
	end

end
