require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    click_link('New Post')
    fill_in('post_title', with: 'my first post')
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    click_button('Create Post')
    visit '/posts'
    expect(page).to have_content('my first post')
  end
  scenario 'edit existed post' do
    visit '/posts'
    click_link('Show')
    expect(page).to have_content('Title:')
    expect(page).to have_content('Content')
    click_link('Edit')
    fill_in('post_title', with:'i modify the title')
    fill_in('post_content', with:'even i modify this post, i still want to be a full stack developer')
    click_button('Update Post')
    expect(page).to have_content('Post was successfully updated.')
  end
  scenario 'Destroy post' do
    visit '/posts'
    click_link('Destroy')
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('Post was successfully destroyed.')
  end
end
