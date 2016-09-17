require 'rails_helper'
RSpec.describe 'creating a blog' do
  it 'creates a new blog and redirects to profile page' do
    user = create_user
    log_in user
    fill_in 'New Blog', with: 'My blog'
    click_button 'Create Blog'
    expect(current_path).to eq("/users/#{user.id}")
    expect(page).to have_text('My blog')
  end
end