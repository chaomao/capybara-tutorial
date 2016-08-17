require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    sleep(5)
    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(0)
        sleep(1)
        page.new_post_link.click
        sleep(1)
        page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
        sleep(1)
        page.create_post_button.click
        sleep(1)
        expect(page.notice_message).to eq('Post was successfully created.')
        page.back_link.click
        expect(page.posts_in_list.length).to eq(1)
    end
  end
end
