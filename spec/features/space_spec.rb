feature 'Listing and seeing spaces' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'User can list a space on a dedicated page' do
    sign_in(email: user.email, password: user.password)
    visit '/spaces/new'
    expect(page).to have_content 'List a new space'
    expect(page).to have_button 'List'
  end

  scenario 'and see it listed in their account' do
    sign_in_list(email: user.email, password: user.password)
    expect(page).to have_content 'Nice condo!'
    expect(page).to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).to have_content '5'
    expect(page).to have_content '2017-10-10'
    expect(page).to have_content '2017-11-11'
  end

  scenario 'or on the homepage' do
    sign_in_list(email: user.email, password: user.password)
    visit '/'
    expect(page).to have_content 'Nice condo!'
    expect(page).to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).to have_content '5'
  end

  scenario 'An unsigned user can also see all spaces on the homepage' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    expect(page).to have_content 'Nice condo!'
    expect(page).to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).to have_content '5'
  end
end
