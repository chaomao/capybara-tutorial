require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    sleep(5)
  end
end
