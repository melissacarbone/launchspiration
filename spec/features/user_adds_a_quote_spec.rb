require 'spec_helper'

feature 'User adds a test' do
  before do
    Capybara.reset_sessions!
  end

  scenario 'After authenticating' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock :twitter, uid: "12345", info: { name: "Jane Smith"}
  visit root_path
  click_link 'Sign in with Twitter'
  click_link 'Add New Quote'
  fill_in 'Quote',      with: 'This is a quote'
  fill_in 'Launcher',   with: 'John Smith'
  fill_in 'Cohort',     with: 'Winter 2013'
  click_on 'Create Quote'


  expect(page).to have_content('Quote was successfully created!')

  end
end
