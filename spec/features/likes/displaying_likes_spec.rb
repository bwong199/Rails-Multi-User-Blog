require 'rails_helper'
RSpec.describe 'displaying likes' do
  before do
    @user = create_user
    log_in @user
    @blog = @user.blogs.create(content: 'Oops')
    Like.create(user: @user, blog: @blog)
  end
  it 'displays amount of likes next to each blog' do
    visit '/blogs'
    expect(page).to have_text(@blog.content)
    expect(page).to have_text('1 likes')
    visit "/users/#{@user.id}"
    expect(page).to have_text(@blog.content)
    expect(page).to have_text('1 likes')
  end
end