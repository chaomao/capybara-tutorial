require 'rails_helper'

RSpec.feature 'post feature: ', type: :feature do

  def have_a_look
    # sleep(1)
  end

  scenario 'create new post' do
    post_create
  end

  # scenario 'create -> view -> destroy post' do
  #   post_create
  #   post_view
  #   post_destroy
  # end

  def post_create
    visit '/posts'
    on_page_with :post_list do |page|
      page.new_post_link.click
    end

    on_page_with :new_post do |page|
      page.perform :fill_post, 'my first post', 'I wanna be a full-stack dev'
      page.create_post_button.click
    end

    on_page_with :show_post do |page|
      expect(page.notice_message).to eq('Post was successfully created.')

      expect(page.post_title).to have_content('my first post')
      expect(page.post_content).to have_content('I wanna be a full-stack dev')

      page.back_link.click
    end

    on_page_with :post_list do |page|
      expect(page.posts_in_list.length).to eq(1)

      # expect(page.post_contents).to have_content('my first post')
      # expect(page.post_contents).to have_content('I wanna be a full-stack dev')
    end

    on_page_with :top_ten do |page|
      expect(page.tips).to have_content('initialize component')
      expect(page.tips).to have_content('start loading...')

      expect(page.top_ten_posts).to have_content('my first post')
    end
  end
end
