class MakersBnB < Sinatra::Base

  get '/spaces' do
    erb :'spaces/index'
  end

  get '/spaces/new' do
    if current_user
      erb :'spaces/new'
    else
      redirect 'sessions/new'
    end
  end

end
