require 'rails_helper'

RSpec.describe Admin, :type => :model do
  # pending "add some examples to (or delete) #{__FILE__}" 
  before do
  	@admin = Admin.new( email: "user@example.com", password: "1234rr", password_confirmation: "1234rr")
  end
  describe "when email is not present" do
		# assign an email address
		before { @admin.email= " "}
		it { should_not be_valid }
	end
	describe "when password is not present" do
		# assign an email address
		before { @admin.password= " "}
		it { should_not be_valid }
	end
	describe "when password_confirmation is not present" do
		# assign an email address
		before { @admin.password_confirmation= " "}
		it { should_not be_valid }
	end

	describe "when your password is too long" do
		before { @admin.password = "a" *30 }
		it { should_not be_valid }
	end

	describe "when your confirmation password is too long" do
		before { @admin.password_confirmation = "a" *30 }
		it { should_not be_valid }
	end
	
end
