class MakersBnB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'white horses'
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def prepare_lists
      @listed_spaces = current_user ? current_user.spaces(order: :created_at.desc) : []
      @rented_spaces = Space.all(rented_by: current_user.id)
    end
  end
end
