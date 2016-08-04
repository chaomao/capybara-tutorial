require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    # expect(page).not_to have_content('initialize')
    # expect(page).to have_content('start loading...')
    # expect(page).to have_content('finish loading')
    click_link('New Post')
    fill_in('post_title', with: 'my first post')
    sleep(1)
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    sleep(1)
    click_button('Create Post')
    sleep(1)
    visit '/posts'
    sleep(1)
    expect(page).to have_content('my first post')
  end
end
