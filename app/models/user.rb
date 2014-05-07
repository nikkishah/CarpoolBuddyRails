class User < ActiveRecord::Base
	before_create :create_remember_token
	before_save { self.email = email.downcase }
	validates :first_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
	format:     { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	has_secure_password
	has_many :families
	has_many :subscriptions
	has_many :groups, through: :subscriptions
	has_many :children, through: :families
	has_one :calendar

	def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
