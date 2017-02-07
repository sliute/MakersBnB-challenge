feature 'Sign in' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'A user can sign in with a correct email & password' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}!"
  end

  scenario 'Sign in fails with incorrect password' do
    sign_in(email: user.email, password: 'superduper')
    expect(page).to have_content 'Email and/or password are/is incorrect'
  end

  scenario 'Sign in fails with incorrect email' do
    sign_in(email: 'someotherjoe@otherinternet.com', password: user.password)
    expect(page).to have_content 'Email and/or password are/is incorrect'
  end
end
