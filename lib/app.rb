ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/spaces'
require_relative 'controllers/sessions'

class MakersBnB < Sinatra::Base

  get '/' do
    @spaces = Space.all(order: :created_at.desc)
    erb :'spaces/index'
  end

  run! if app_file == $0
end
