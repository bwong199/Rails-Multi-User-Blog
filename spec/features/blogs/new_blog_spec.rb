require 'rails_helper'
RSpec.describe 'new blog' do
  it 'provides form in user profile page to create a new blog' do
    user = create_user
    log_in user
    expect(page).to have_field('New Blog')
  end
end