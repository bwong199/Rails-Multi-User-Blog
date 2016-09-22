class BlogsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def new 
		@blog = Blog.new
	end 

	def index
		@blogs = Blog.all
		@userlikes = Like.all
		@comment = Comment.new

		respond_to do |format|
		   format.html # show.html.erb
		   format.json { render json: @blogs.to_json(:include => [:comments, :likes])}
		 end
	end 

	def edit
		@blog = Blog.find(params[:id])
	end 

	def update
		blog = Blog.find(params[:id])
		blog.update_attributes(blog_params)
		redirect_to user_path(current_user)
	end 

	def show
		@blog = Blog.find(params[:id])
	

		respond_to do |format|
		   format.html # show.html.erb
		   format.json { render json: @blog.to_json(:include => [:comments, :likes])}
		 end
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
		params.require(:blog).permit(:content, :blog_id, :user_id)
	end 

	def require_correct_user
		user = Blog.find(params[:id]).user
		redirect_to user_path(current_user) if current_user != user
	end
end
