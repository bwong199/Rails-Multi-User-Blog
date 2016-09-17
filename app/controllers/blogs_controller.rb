class BlogsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]

	def new 
		@blog = Blog.new

	end 

	def index
		@blogs = Blog.all
		@userlikes = Like.all

	end 

	def show

	end 

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy if blog.user == current_user
		redirect_to user_path(current_user)

	end 

	def create
		@blog = current_user.blogs.build(blog_params)
		if @blog.save
			redirect_to user_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end 


	private

	def blog_params
		params.require(:blog).permit(:content)
	end 

end