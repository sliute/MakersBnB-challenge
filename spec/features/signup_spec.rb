require 'spec_helper'

feature 'Sign up' do
  scenario '' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.email).to eq 'johndoe@internet.com'
    expect(page).to have_content 'Welcome, johndoe!'
    expect(page.current_path).to eq '/spaces'
  end
end
