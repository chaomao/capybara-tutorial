require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    sleep(1)
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
    expect(page).to have_content('Post was successfully created.')
    visit '/posts'
    sleep(1)
    expect(page).to have_content('my first post')

    click_link('Edit')
    
    fill_in('post_title', with: 'my second edit post')
    fill_in('post_content', with: 'I wanna be the full-stack dev yep')
    
    click_button('Update Post')

    expect(page).to have_content('Post was successfully updated.')
    
    visit '/posts'
   
    expect(page).to have_css("table td", text: "my second edit post")
    expect(page).to have_content('initialize component')
    sleep(5)
    expect(page).not_to have_content('start loading...')
    sleep(1)
    expect(find(:xpath, '//ul/li').text).to have_content('my second edit post')

  end
end
