feature 'Renting spaces' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }
  let!(:user2) { User.create(email: 'janedoe@internet.com', username: 'janedoe', password: 'test', password_confirmation: 'test') }

  scenario 'User can rent a space by clicking on a button' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    expect(page).to have_button 'Rent'
    click_button 'Rent'
    expect(page).to have_content 'Nice condo!'
    expect(page).to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).to have_content '5'
  end
end
