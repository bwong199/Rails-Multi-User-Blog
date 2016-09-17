class LikesController < ApplicationController
	def new 

	end 

	def create
		user = User.find(params[:user_id])
		blog = Blog.find(params[:blog_id])
		Like.create(user: user, blog: blog)
		redirect_to blogs_path
	end 


	def destroy 
		like = Like.find(params[:id])
		like.destroy
		redirect_to blogs_path
	end 
end
