class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	
	def new
		@user = User.new

	end 

	def create
		@user = User.new(user_params)
		if User.create(user_params).valid? 
			puts "VALID"
			User.create(user_params)
			last_user = User.last
			session[:user_id] = last_user.id
			redirect_to user_path(last_user.id)
		else
			flash[:errors] =  "can't be blank. invalid" 
			puts "INVALID"
			redirect_to new_user_path
		end 
	end

	def edit
		@user = User.find(params[:id])
	end  

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		puts @user.errors.full_messages
		redirect_to user_path(params[:id])
	end 

	def destroy 
		session[:user_id] = nil
		User.find(params[:id]).destroy
		redirect_to new_session_path
	end

	def show
		@user = User.find(params[:id])
		@userBlog = User.find(params[:id]).blogs.all
		@blog = Blog.new
	end 


	private 
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def blog_params
		params.require(:blog).permit(:content)
	end 
end
