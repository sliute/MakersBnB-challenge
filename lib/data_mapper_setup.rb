require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps' # TBD

require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/request'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
