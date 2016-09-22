require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
	before do
		@user = create_user
		@blog = @user.blogs.create(content: 'Oops')
		@comment = Comment.create(user: @user, blog: @blog, content: "New content")
	end
	describe "when not logged in" do
		before do
			session[:user_id] = nil
		end
		it "cannot comment" do
			post :create 
			expect(response).to redirect_to('/login')
		end

		it "cannot delete comment" do
			post :destroy, id: @comment
			expect(response).to redirect_to('/login')
		end
	end
end
