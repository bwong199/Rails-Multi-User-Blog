class SessionsController < ApplicationController

	def new 

	end



	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
		    session[:user_id] = user.id
		    redirect_to user
		    puts "Authenticated"
		 else
		    redirect_to new_session_path
		    flash[:errors] = "Invalid"
		    puts "Not authenticated"
		 end
	end

	def destroy
		session[:user_id] = nil
		redirect_to new_session_path
	end   
end
