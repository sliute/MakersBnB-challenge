feature 'Sign up' do
  scenario 'A user can sign up with email, username, password and password confirmation' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.email).to eq 'johndoe@internet.com'
    expect(page).to have_content 'johndoe'
    expect(current_path).to eq '/spaces'
  end

  scenario 'Sign up fails if email is entered incorrectly' do
    expect { sign_up(email: 'johndoe@internet') }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Sign up fails if no email is entered' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'Sign up fails if no password confirmation is entered' do
    expect { sign_up(password_confirmation: nil) }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'Sign up fails if no username is entered' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'Sign up fails with an existing username' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Username is already taken')
  end

  scenario 'Sign up fails with an existing email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page.current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end

end
