class User < ActiveRecord::Base
	# call back function that saves and in downcase
	# In the model self keyword is optional on the right-hand side
	before_save { self.email = email.downcase }
	# Makes sure that there is something in the name field
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						# Rails infers that uniqueness should be true as well so we don't have to add it in.
						uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
	# Ability to save a securely hased password_digest attribute to the database
	# A pair of virtual attributes (password and password_conforimation)
	# An authenticate method that returns the user when the password is currect
	# rails g migration add_password_digest_to_users password_digest:string

end
