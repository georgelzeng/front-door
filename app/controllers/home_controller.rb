class HomeController < ApplicationController
	def index
		@user = current_user
		if @user == nil
			render template: "sessions/new"
		else
			render template: "home/index"
		end
	end


	def open
	  	@user = current_user
	  	@user.uses = @user.uses + 1
	  	@user.save
	  	render template: "home/index"
	end

end
