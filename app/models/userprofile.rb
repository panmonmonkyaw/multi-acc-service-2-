class Userprofile < ActiveRecord::Base
	has_many :application_types
	validates :userid, :first_name, :last_name, :name, :email, :phone_number, presence: true
	validates_inclusion_of :gender, in: %w(Male Female)
	#validates :email, :presence true
	validates :userid, numericality: { only_integer: true}
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_length_of :first_name, maximum: 30
	validates_length_of :last_name, maximum: 30, message: "less than 30"
	validates_length_of :phone_number, in: 7..32, allow_blank: true
	validates_length_of :name, maximum: 50

	# def before_save
	# 	@Userprofile.status = "false"
	# end
end
