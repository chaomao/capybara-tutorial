require 'rails_helper'
require_relative './pages/post_list_page'
require_relative './pages/post_detail_page'
require_relative './pages/result_page'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit PostListPage::URL
    sleep 1
    click_link PostListPage::NEW_POST_LINK
    sleep 1
    fill_in(PostDetailPage::TITLE_INPUT, with: 'post title')
    sleep 1
    fill_in(PostDetailPage::CONTENT_INPUT, with: 'post content')
    sleep 1
    click_button(PostDetailPage::CREATE_BUTTON)
    sleep 1
    expect(find_by_id(ResultPage::NOTICE_ID)).to have_content('Post was successfully created.')
    click_link(ResultPage::BACK_LINK)
    sleep 1

    expect(page).not_to have_content('initialize')
    expect(page).to have_content('start loading...')
    expect(page).to have_content('post title')
  end
end
