require "userprofiles_controller"
require "application_types_controller"
class UserstatusController < ApplicationController
	def user
		@userprofiles = Userprofile.all
		 @application_types = ApplicationType.all
	
	end
end
