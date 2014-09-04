require 'rails_helper'

 RSpec.describe Userprofile, :type => :model do
   
	before do
		 @userprofile = Userprofile.new(name: "example user", email: "user@example.com")
	end

	describe "when email is not present" do
		# assign an email address
		before { @userprofile.email= " "}
		it { should_not be_valid }
	end
	describe "when name is not present" do
		# assign an email address
		before { @userprofile.name= " "}
		it { should_not be_valid }
	end
	describe "when first_name is not present" do
		# assign an email address
		before { @userprofile.first_name= " "}
		it { should_not be_valid }
	end
	describe "when last_name is not present" do
		# assign an email address
		before { @userprofile.last_name= " "}
		it { should_not be_valid }
	end
	describe "when gender is not present" do
		# assign an email address
		before { @userprofile.gender= " "}
		it { should_not be_valid }
	end
	describe "when phone_number is not present" do
		# assign an email address
		before { @userprofile.phone_number= " "}
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @userprofile.name = "a" *51 }
		it { should_not be_valid }
	end

	describe "when first name is too long" do
		before { @userprofile.first_name = "a" *35 }
		it { should_not be_valid }
	end

	describe "when last name is too long" do
		before { @userprofile.last_name = "a" *35 }
		it { should_not be_valid }
	end

	

	 it "is valid with a userid, first_name, last_name and email" do
	 	userprofile = Userprofile.new(			
		    userid: '001' ,
			first_name: 'Aaron' ,
			last_name: 'Sumner',
	 		email: 'tester@example.com',
	 		name: 'Aaron Sumner',
	 		phone_number: '39499302',
	 		gender: 'male'
	 		)
		
     end
 

  
    it "is invalid email formats" do
    	userprofile = Userprofile.new(
         name: '032' ,
         name: '2pp.' ,
         name: 'jaME' ,
         name: 'jame@$' ,
         name: 'jame45NKl@&^%$#' ,
         name: 'kyaw')

    end

    subject { @userprofile }

    describe "when email addresses is already token" do
    	before do
    		userprofile_with_same_email = @userprofile.dup
    		userprofile_with_same_email.email = @userprofile.email.upcase
    		userprofile_with_same_email.save
    	end
    	it { should_not be_valid }

    end
    # it "returns a full name as a string" do
    # 	userprofile = build_stubbed(:userprofile, first_name: "Joe",last_name:
    # 		"Smith")
    # 	expect(userprofile.name).to eq "Joe Smith"
    # end

 #it "is invalid without a userid" do
 	#expect (Userprofile.new(userid: nil)).to have(1).errors_on:(:userid)
 	# it { should accept_values_for(:email, "john@example.com", "lambda@example.com")}
 	# it{should_not accept_values_for(:email, "aa@bb.com")}
 end




