require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = create_user
    log_in @user
  end
  it "displays a user's blogs on profile page" do
    blog = @user.blogs.create(content: 'blog')
    visit "/users/#{@user.id}"
    expect(page).to have_text("#{blog.content}")
  end
  it "displays everyone's blogs" do
    user2 = create_user 'julius', 'julius@lakers.com'
    blog1 = @user.blogs.create(content: 'blog')
    blog2 = user2.blogs.create(content: 'blog')
    visit '/blogs'
    expect(page).to have_text(blog1.content)
    expect(page).to have_text(blog2.content)
  end
end