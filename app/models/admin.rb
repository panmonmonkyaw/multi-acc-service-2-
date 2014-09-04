require 'bcrypt'
class Admin < ActiveRecord::Base
	# attr_accessible :email, :password, :password_confirmation
	attr_accessor :password
	before_save :encrypt_password
	 validates_confirmation_of :password
	validates_presence_of :password, :on => "create"
	validates_length_of :password, maximum: 20, minimum: 6
	validates_length_of :password_confirmation, maximum: 20, minimum: 6
	 validates_presence_of :email
	 validates_uniqueness_of :email
	 # validates :email, presence :true, uniqueness: { case_sensitive :true }
	 # validates :password_hash
	 validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	    end
    end

	def self.authenticate(email, password)
		admin = find_by_email(email)
		if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
		# if admin
			 admin 
		else
			nil
		end
	end

	


end
