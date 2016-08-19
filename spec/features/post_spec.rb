require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(0)
        page.new_post_link.click
    end

    on_page_with :post_new do |page|
      page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
      page.create_post_button.click
    end
  end
end
