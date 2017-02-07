feature 'Space' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'list a space on a dedicated page' do
    sign_in(email: user.email, password: user.password)
    visit '/spaces/new'
    expect(page).to have_content 'List a new space'
    expect(page).to have_button 'List'
  end
end
