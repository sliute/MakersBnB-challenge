feature 'Approving requests' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }
  let!(:user2) { User.create(email: 'janedoe@internet.com', username: 'janedoe', password: 'test', password_confirmation: 'test') }

  scenario 'User can view requests for a specific space they listed' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in_request_sign_out(email: user2.email, password: user2.password)
    sign_in_view_requests(email: user.email, password: user.password)
    expect(current_path).to eq '/spaces/view_requests'
    expect(page).to have_content 'Nice condo!'
    expect(page).to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).to have_content '5'
    expect(page).to have_content 'janedoe'
    expect(page).to have_content '2017-11-10'
    expect(page).to have_button 'Approve'
    expect(page).to have_button 'Reject'
  end

  scenario 'User can approve a specific request' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in_request_sign_out(email: user2.email, password: user2.password)
    sign_in_view_requests(email: user.email, password: user.password)
    click_button 'Approve'
    click_button 'Sign Out'
    sign_in(email: user2.email, password: user2.password)
    visit '/users/my_account'
    expect(page).to have_content 'You have booked:'
  end

  scenario 'User can reject a specific request' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in_request_sign_out(email: user2.email, password: user2.password)
    sign_in_view_requests(email: user.email, password: user.password)
    click_button 'Reject'
    click_button 'Sign Out'
    sign_in(email: user2.email, password: user2.password)
    visit '/users/my_account'
    expect(page).not_to have_content 'You have booked:'
    expect(page).not_to have_content 'Nice condo!'
    expect(page).not_to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).not_to have_content '5'
  end

  scenario 'User does not see request button if no request has been made' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    visit '/users/my_account'
    expect(page).not_to have_content 'View Requests'
  end

  scenario 'User does not see request button if no request has been made' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    fill_in :request_date, with: '2017-11-10'
    click_button 'Request Space'
    click_button 'Sign Out'
    sign_in(email: user.email, password: user.password)
    visit '/users/my_account'
    expect(page).to have_content 'View Requests'
  end
end
