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

    on_page_with :post_new_detail do |page|
      expect(page.notice_message).to eq('Post was successfully created.')
      expect(page.title).to eq('my first post')
      expect(page.content).to eq('I wanna be the full-stack dev')
      page.back_link.click
    end

    on_page_with :post_list do |page|
      expect(page.posts_in_list.length).to eq(1)
    end

    on_page_with :top_ten_list do |page|
      expect(page).to have_selector('.top-10-list')
      expect(page.article_count).to eq 1
      expect(page.articles.first).to eq('my first post')
    end
  end

  scenario 'delete post' do
    Post.create(title: 'Today News', content: 'Nothing good')
    visit '/posts'
    on_page_with :post_list do |page|
      expect(page.posts_in_list.length).to eq(1)
      click_link('Destroy')
      page.accept_confirm do
        click_link 'Delete'
      end
      expect(page.notice_message).to eq('Post was successfully destroyed.')
    end


    on_page_with :top_ten_list do |page|
      expect(page).to have_selector('.top-10-list')
      expect(page.article_count).to eq 0
    end
  end
end
