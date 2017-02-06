#Notes On Our Approach

##Implementation for MVP
User can sign up, sign in and sign out.
User can see list of all available spaces without being signed in.
When signed in user can see all available spaces.
When signed in, user can list a space.
When signed in, user can rent a space.
When signed in, user can view their own account.

###What will go on the list of spaces page:
- Name
- Short description
- Price per night
- Button saying click to rent

###What will go on the account page:
- List of my spaces, both rented and available clearly defined.
- List of spaces you have rented.

When MVP is ready, push to heroku!

##Implementation after MVP
Calendarise.
Pictures of spaces.
Search engine ([tags] [period]).
Owner approved/rejection.


#Notes on Each Frame

##Homepage
- Route: '/'
- HTML Title: 'MakersBnB'
- List of spaces: name, description, price (no rent button)
- Sign in: Text Boxes for email, password. Button for sign-in.
- Link for sign up.

##Properties- Logged In
- Route: '/'
- HTML Title: 'MakersBnB'
- List of spaces: name, description, price
- Rent button for each space which directs you to your account
- My account (link)
- List a space (link)
- Sign out (link)

##Sign-Up
- Route: '/Users/New'
- HTML Title: MakersBnB | Sign Up
- Within the form:
  - Username
  - Email
  - Password
  - Confirm password
  - Button for sign up
- Go back (link)
- Will re-direct you to Properties Logged In.

##List Your Space
- Route: '/Spaces/New'
- HTML Title: 'MakersBnB | List A Apace'
- Within the form:
  - Name
  - Description
  - Price
  - Button for list (takes you to my account)
- Home (link) - takes you to Properties logged-in
- My account (link)
- Sign out (link)

##My Account
- Route: '/Sessions/My_Account'
- HTML Title: 'MakersBnB | My Account'
- Header: 'Welcome, username'
- List of your spaces (status- rented or available )
- List of rented spaces
- Home (link) - takes you to Properties logged-in
- List a space (link)
- Sign out (link)
