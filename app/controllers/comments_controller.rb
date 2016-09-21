class CommentsController < ApplicationController

	def create 
		user = User.find(params[:user_id])
		blog = Blog.find(params[:blog_id])
		Comment.create(user: user, blog: blog, content: comment_params[:content])
		redirect_to blogs_path
	end 

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy if comment.user == current_user
		redirect_to blogs_path
	end 

	private
	def comment_params
		params.require(:comment).permit(:content, :blog_id, :user_id)
	end 
end
