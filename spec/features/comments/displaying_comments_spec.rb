require 'rails_helper'
RSpec.describe 'displaying comments' do
  before do
    @user = create_user
    log_in @user
    @blog = @user.blogs.create(content: 'Oops')
    @comment = Comment.create(user: @user, blog: @blog, content: "New comment")
  end
  it 'displays amount of comments next to each blog' do
    visit '/blogs'
    expect(page).to have_text(@blog.content)
    expect(page).to have_text(@comment.content)
    visit "/users/#{@user.id}"
    expect(page).to have_text(@blog.content)
    expect(page).to have_text(@comment.content)
  end
end