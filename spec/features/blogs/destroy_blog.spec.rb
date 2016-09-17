require 'rails_helper'
RSpec.describe 'deleting a blog' do
  before do
    @user = create_user
    log_in @user
    fill_in 'New Blog', with: 'My blog'
    click_button 'Create Blog'
    expect(page).to have_text('My blog')
  end
  it 'deletes blogs from profile page and redirects to profile page' do
    click_button 'Delete'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My blog')
  end
  it 'deletes blog from blogs index page and redirects to current user profile page' do
    visit '/blogs'
    click_button 'Delete'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My blog')
  end
end