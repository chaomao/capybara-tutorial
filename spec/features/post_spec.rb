require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    find('div>a').click
    fill_in('post_title', with: 'my first post')
    fill_in('post_content', with: 'I wanna be the full-stack dev')
    click_button('Create Post')
    expect(page).to have_content('Post was successfully created.')
    visit '/posts'
    posts = page.all('.left tbody>tr')
    expect(posts.count).to eq(1)
    expect(posts.first.all('td')[0]).to have_content('my first post')
    expect(posts.first.all('td')[1]).to have_content('I wanna be the full-stack dev')
    top10 = find('.top-10-container')
    expect(top10).to have_content('initialize component')
    expect(top10).to have_content('start loading...')
    expect(top10).to have_content('my first post')
 end
end
