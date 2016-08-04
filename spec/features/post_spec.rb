require 'rails_helper'

RSpec.feature 'post feature', type: :feature do
  scenario 'create new post' do
    visit '/posts'
    expect(page).not_to have_content('initialize')
    expect(page).to have_content('start loading...')
    expect(page).to have_content('finish loading')
  end
end
