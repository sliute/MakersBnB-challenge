feature 'Sign out' do
  before(:each) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'after having signed in' do
    sign_in(email: 'johndoe@internet.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content 'See you later!'
    expect(page).not_to have_content "Welcome, johndoe!"
  end
end
