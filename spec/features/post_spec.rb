require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    click_link('New Post')
    fill_in('post_title', with: 'my first post')
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')
    visit '/posts'
    expect(page).to have_content('my first post')
    expect(page).to have_selector('.top-10-list')
    top_articles = find('.top-10-list').all('li').collect(&:text)
    expect(top_articles).to include('my first post')
  end
end
