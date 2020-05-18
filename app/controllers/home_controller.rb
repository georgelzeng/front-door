class HomeController < ApplicationController
	def index
	end


	def open
	  	@user = current_user
	  	@user.uses = @user.uses + 1
	  	@user.save
	  	render template: "home/index"
	end

end
