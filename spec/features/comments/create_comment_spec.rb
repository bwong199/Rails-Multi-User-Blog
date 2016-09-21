require 'rails_helper'
RSpec.describe 'creating a comment' do
	before do
	  @user = create_user
	  log_in @user
	  fill_in 'New Blog', with: 'My blog'
	  click_button 'Create Blog'
	end

  it 'creates a new comment and redirects to profile page' do
    fill_in 'New Comment', with: 'My comment'
    click_button 'Comment'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_text('My comment')
  end
end