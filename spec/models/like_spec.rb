require 'rails_helper'
RSpec.describe Like, type: :model do
	describe 'relationships' do
		before do
			@user = create_user
			@blog = @user.blogs.create(content: 'Oops')
			@like = Like.create(user: @user, blog: @blog)
		end
		it 'belongs to a user' do
			expect(@like.user).to eq(@user)
		end
		it 'belongs to a blog' do
			expect(@like.blog).to eq(@blog)
		end
	end
end