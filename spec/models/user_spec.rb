require 'rails_helper'
RSpec.describe User do
  # ...
  describe 'relationships' do
    it 'has many blogs' do
      user = create_user
      blog1 = user.blogs.create(content: 'blog 1')
      blog2 = user.blogs.create(content: 'blog 2')
      expect(user.blogs).to include(blog1)
      expect(user.blogs).to include(blog2)
    end
    it 'has many likes' do
      user = create_user
      blog1 = user.blogs.create(content: 'Oops')
      blog2 = user.blogs.create(content: 'I did it again')
      like1 = Like.create(user: user, blog: blog1)
      like2 = Like.create(user: user, blog: blog2)
      expect(user.likes).to include(like1)
      expect(user.likes).to include(like2)
    end
  end
end