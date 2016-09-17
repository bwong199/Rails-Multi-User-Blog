require 'rails_helper'
RSpec.describe Blog, type: :model do
  it 'requires content' do
    blog = Blog.new
    blog.valid?
    expect(blog.errors[:content].any?).to eq(true)
  end
  describe 'relationships' do
    it 'belongs to a user' do
      user = create_user
      blog = user.blogs.create(content: 'blog 1')
      expect(blog.user).to eq(user)
    end
    it 'has many likes' do
      user1 = create_user
      user2 = create_user 'julius', 'julius@lakers.com'
      blog = user1.blogs.create(content: 'blog 1')
      like1 = Like.create(user: user1, blog: blog)
      like2 = Like.create(user: user2, blog: blog)
      expect(blog.likes).to include(like1)
      expect(blog.likes).to include(like2)
    end
  end
end