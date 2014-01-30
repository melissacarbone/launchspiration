require 'spec_helper'

feature 'user signs out' do

  before do
    OmniAuth.config.test_mode = true
  end

  scenario 'can do so successfully and sign out succeeds' do
    OmniAuth.config.add_mock :twitter, uid: "12345", info: { name: "Jane Smith" }

    visit root_path
    click_link 'Sign in with Twitter'
    click_link 'Sign Out'

    expect(page).to have_content "Signed out!"
    expect(page).to have_content "Sign in with Twitter"
  end
end
