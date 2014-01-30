require 'spec_helper'

feature 'User views a quote' do
  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock :twitter, uid: "12345", info: { name: "Jane Smith"}
    Quote.create(content: 'This is a quote', author: 'Jane Smith', cohort: 'Winter 2013')
  end
  scenario 'after authenticating' do
    visit root_path
    click_link "Sign in with Twitter"
    click_link "Get Started!"
    save_and_open_page
    expect(page).to have_content("Need some inspiration? Click Here!")
  end
end
