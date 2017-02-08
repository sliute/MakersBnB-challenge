feature 'Sign out' do
  before(:each) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'after having signed in' do
    sign_in(email: 'johndoe@internet.com', password: 'test')
    click_button 'Sign Out'
    expect(page).to have_button "Sign in"
    expect(page).not_to have_content "johndoe"
  end
end
