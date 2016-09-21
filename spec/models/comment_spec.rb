require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'relationships' do
  	before do
  		@user = create_user
  		@blog = @user.blogs.create(content: 'Oops')
  		@comment = Comment.create(user: @user, blog: @blog)
  	end
  	it 'belongs to a user' do
  		expect(@comment.user).to eq(@user)
  	end
  	it 'belongs to a blog' do
  		expect(@comment.blog).to eq(@blog)
  	end
  end
end
