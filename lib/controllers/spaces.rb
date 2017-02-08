class MakersBnB < Sinatra::Base
  get '/spaces' do
    @spaces = Space.all(order: :created_at.desc)
    erb :'spaces/index'
  end

  get '/spaces/new' do
    if current_user
      erb :'spaces/new'
    else
      redirect 'sessions/new'
    end
  end

  post '/spaces' do
    space = Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: current_user.id)
    current_user.spaces << space
    current_user.save
    prepare_lists
    erb :'/users/my_account'
  end

  post '/spaces/rent' do
    space = Space.first(id: params[:rented_space_id].to_i)
    space.update(rented_by: current_user.id)
    prepare_lists
    erb :'/users/my_account'
  end
end
