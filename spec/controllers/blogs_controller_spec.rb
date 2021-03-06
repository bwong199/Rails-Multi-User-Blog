require 'rails_helper'
RSpec.describe BlogsController, type: :controller do
  before do
    @user = create_user
    @blog = @user.blogs.create(content: "blog")
  end
  describe "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
      get :index
      expect(response).to redirect_to('/login')
    end
    it "cannot access create" do
      post :create
      expect(response).to redirect_to('/login')
    end
    it "cannot access destroy" do
      delete :destroy, id: @blog
      expect(response).to redirect_to('/login')
    end
  end
  describe "when logged in as the wrong user" do
    before do
      @wrong_user = create_user 'julius', 'julius@lakers.com'
      session[:user_id] = @wrong_user.id
      @blog = @user.blogs.create(content: 'Ooops')
    end
    it "cannot edit other user's post" do
      post :edit, id: @blog
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
    it "cannot access destroy" do
      delete :destroy, id: @blog, user_id: @user
      expect(response).to redirect_to("/users/#{@wrong_user.id}")
    end
  end
end