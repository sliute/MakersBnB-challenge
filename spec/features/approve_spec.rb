feature 'Approving requests' do
  let!(:user) { User.create(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test') }
  let!(:user2) { User.create(email: 'janedoe@internet.com', username: 'janedoe', password: 'test', password_confirmation: 'test') }

  scenario 'User can view requests for a specific space they listed' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    # use datepicker to pick a date here... such as 2017-11-10 (Nov 10, one day before end_date)
    # datepicker should use min and max based on this space's start and end dates.
    fill_in :request_date, with: '2017-11-10'
    click_button 'Rent'

    click_button 'Sign Out'
    sign_in(email: user.email, password: user.password)
    visit '/users/my_account'
    click_button 'View Requests'
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
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    # use datepicker to pick a date here... such as 2017-11-10 (Nov 10, one day before end_date)
    # datepicker should use min and max based on this space's start and end dates.
    fill_in :request_date, with: '2017-11-10'
    click_button 'Rent'
    click_button 'Sign Out'
    sign_in(email: user.email, password: user.password)
    visit '/users/my_account'
    click_button 'View Requests'
    click_button 'Approve'
    click_button 'Sign Out'
    sign_in(email: user2.email, password: user2.password)
    visit '/users/my_account'
    expect(page).to have_content 'You have booked:'
  end

  scenario 'User can reject a specific request' do
    sign_in_list_sign_out(email: user.email, password: user.password)
    sign_in(email: user2.email, password: user2.password)
    visit '/'
    # use datepicker to pick a date here... such as 2017-11-10 (Nov 10, one day before end_date)
    # datepicker should use min and max based on this space's start and end dates.
    fill_in :request_date, with: '2017-11-10'
    click_button 'Rent'
    click_button 'Sign Out'
    sign_in(email: user.email, password: user.password)
    visit '/users/my_account'
    click_button 'View Requests'
    click_button 'Reject'
    click_button 'Sign Out'
    sign_in(email: user2.email, password: user2.password)
    visit '/users/my_account'
    expect(page).not_to have_content 'You have booked:'
    expect(page).not_to have_content 'Nice condo!'
    expect(page).not_to have_content 'A lovely one-bedroom condo in southern France, far from foggy London.'
    expect(page).not_to have_content '5'
  end
end
