require 'spec_helper'

feature 'User signs in' do
    before do
    OmniAuth.config.test_mode = true
  end
  scenario 'can do so successfully and authentication succeeds' do
    OmniAuth.config.add_mock :twitter, uid: "12345", info: { name: "Jane Smith"}

    visit root_path
    click_link 'Sign in with Twitter'

    expect(page).to have_content "Signed in!"
  end

  scenario 'fails to do so when authentication fails' do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }

    visit root_path
    click_link 'Sign in with Twitter'

    expect(page).to have_content "Authentication Failed"
  end
end
