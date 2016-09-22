require 'rails_helper'
RSpec.describe LikesController, type: :controller do
	before do
		@user = create_user
		@blog = @user.blogs.create(content: 'Oops')
		@like = Like.create(user: @user, blog: @blog)
	end
	describe "when not logged in" do
		before do
			session[:user_id] = nil
		end
		it "cannot like" do
			post :create 
			expect(response).to redirect_to('/login')
		end

		it "cannot unlike" do
			post :destroy, id: @blog
			expect(response).to redirect_to('/login')
		end
	end

	describe "when logged in as the wrong user" do
	  before do
	    @wrong_user = create_user 'julius', 'julius@lakers.com'
	    session[:user_id] = @wrong_user.id
	    @like = @blog.likes.create(user: @user, blog: @blog)
	  end
	  it "cannot access destroy" do

	  	expect(page).not_to have_button('Like')
	    # delete :destroy, id: @like.id
	    # expect(response).to redirect_to("/users/#{@wrong_user.id}")
	  end
	end
end
