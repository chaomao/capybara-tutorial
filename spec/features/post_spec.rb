require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    sleep(1)
    on_page_with :post_list do |page|
        page.post_list
    end
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
