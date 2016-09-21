require 'rails_helper'
RSpec.describe 'deleting a comment' do
  before do
    @user = create_user
    log_in @user
    fill_in 'New Blog', with: 'My blog'
    click_button 'Create Blog'
    expect(page).to have_text('My blog')
    fill_in 'New Comment', with: 'My comment'
    click_button 'Comment'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).to have_text('My comment')
  end

  it 'deletes comment from profile page and redirects to profile page' do
    visit '/users/#{@user.id}'
    click_button 'Delete comment'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My comment')
  end

  it 'deletes comment from blogs index page and redirects to current user profile page' do
    visit '/blogs'
    click_button 'Delete comment'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My comment')
  end

  it 'deletes comment from profile page and redirects to profile page after delete blog' do 
    visit '/users/#{@user.id}'
    click_button 'Delete blog'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My comment')
  end 

  it 'deletes comment from index page and redirects to index page after delete blog' do 
    visit '/blogs'
    click_button 'Delete blog'
    expect(current_path).to eq("/users/#{@user.id}")
    expect(page).not_to have_text('My comment')
  end 
end