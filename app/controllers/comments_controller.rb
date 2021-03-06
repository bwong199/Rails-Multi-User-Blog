class CommentsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]

	def index

	end 


	def create 
		user = User.find(params[:user_id])
		blog = Blog.find(params[:blog_id])
		Comment.create(user: user, blog: blog, content: comment_params[:content])
		redirect_to user_path(current_user)
	end 

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy if comment.user == current_user
		redirect_to user_path(current_user)
	end 

	private
	def comment_params
		params.require(:comment).permit(:content, :blog_id, :user_id)
	end 
end
