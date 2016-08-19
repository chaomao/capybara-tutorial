require 'rails_helper'

RSpec.feature 'post feature', type: :feature do

  scenario 'create new post' do
    visit '/posts'
    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(0)
        page.new_post_link.click
    end

    on_page_with :new_post do |page|
        page.perform :fill_post, 'my first post', 'I wanna be the full-stack dev'
        page.create_post_button.click
        expect(page.notice_message).to eq('Post was successfully created.')
        page.back_link.click
    end

    on_page_with :post_list do |page|
        expect(page.posts_in_list.length).to eq(1)
        expect(page.first_post_in_list.name).to eq('my first post')
        expect(page.first_post_in_list.content).to eq('I wanna be the full-stack dev')
    end

    on_page_with :top_post_list do |page|
        expect(page.first_top_post_name).to eq('my first post')
    end
  end

end
