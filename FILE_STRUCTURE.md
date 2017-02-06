#MakersBnB - File structure check-list

- gemfile
- gemfile.lock
- README.md
- rakefile
- procfile
- config.ru
- .rspec

##Lib
- app.rb
- data_mapper_setup.rb
- server.rb

###Controllers
- users.rb
- sessions.rb
- spaces.rb

###Models
- user.rb
  - requires BCRYPT and includes datamapper::resource
  * ID
  * Email - required, unique, format: email address
  * Username - required, unique
  * Password Digest
  - Relationship: has n spaces through resource
- space.rb
  * ID
  * Name
  * Description
  * Price
  * Rented by (default value of nil- later will have a method of available?)
  - Relationship: Belongs to user

###Views
- layout.erb (incl. new session(sign-in))
- flash.erb
- welcome.erb
- /Users/
  * new.erb
- /Sessions/
  * my_account.erb
- /Spaces/
  * index.erb
  * new.erb

##Spec
- spec_helper.rb

### Features
- user_sign_in_spec.rb
- user_sign_out_spec.rb
- user_sign_up_spec.rb
- ... more to come ...

###Helpers
- feature_helpers.rb
- web_helpers.rb

###Models
- user_spec.rb
- spec_spec.rb
