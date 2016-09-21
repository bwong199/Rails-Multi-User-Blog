require 'rails_helper'
RSpec.describe 'creating a comment' do
	before do
	  @user = create_user
	  log_in @user
	  fill_in 'New Blog', with: 'My blog'
	  click_button 'Create Blog'
	end

	it 'provides form in user profile page to create a new comment' do
	  expect(page).to have_field('New Comment')
	end
end