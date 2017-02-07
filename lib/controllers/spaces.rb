class MakersBnB < Sinatra::Base

  get '/spaces' do
    erb :'spaces/index'
  end

end
