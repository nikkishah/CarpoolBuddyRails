class Child < ActiveRecord::Base
	has_many :families
	has_many :users, through: :families
end
