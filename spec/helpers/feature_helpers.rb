module FeatureHelpers

  def sign_up(email: 'johndoe@internet.com', username: 'johndoe', password: 'test', password_confirmation: 'test')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_in_list(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
    visit '/spaces/new'
    fill_in :name, with: 'Nice condo!'
    fill_in :description, with: 'A lovely one-bedroom condo in southern France, far from foggy London.'
    fill_in :price, with: '5'
    fill_in :start_date, with: '2017-10-10'
    fill_in :end_date, with: '2017-11-11'
    click_button 'List'
  end

  def sign_in_list_sign_out(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
    visit '/spaces/new'
    fill_in :name, with: 'Nice condo!'
    fill_in :description, with: 'A lovely one-bedroom condo in southern France, far from foggy London.'
    fill_in :price, with: '5'
    fill_in :start_date, with: '2017-10-10'
    fill_in :end_date, with: '2017-11-11'
    click_button 'List'
    click_button 'Sign Out'
  end

  def sign_in_request(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
    fill_in :request_date, with: '2017-11-10'
    click_button 'Rent'
  end

  def sign_in_request_sign_out(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
    fill_in :request_date, with: '2017-11-10'
    click_button 'Rent'
    click_button 'Sign Out'
  end

  def sign_in_view_requests(email:, password:)
    visit '/'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
    visit '/users/my_account'
    click_button 'View Requests'
  end
end
