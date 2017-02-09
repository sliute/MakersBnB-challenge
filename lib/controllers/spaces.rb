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
    space = Space.create(name: params[:name], description: params[:description],
    price: params[:price], start_date: params[:start_date], end_date: params[:end_date], user_id: current_user.id)
    current_user.spaces << space
    current_user.save
    prepare_lists
    erb :'/users/my_account'
  end

  post '/spaces/rent' do
    space = Space.first(id: params[:rented_space_id].to_i)
    # space.update(rented_by: current_user.id)
    req = Request.create(request_date: params[:request_date], status: 'Pending', user_id: current_user.id, space_id: space.id)
    prepare_lists
    erb :'/users/my_account'
  end

  post '/spaces/view_requests' do
    @space = Space.get(params[:space_id])
    @reqs = Request.all(space_id: params[:space_id])
    @viewable_reqs = @reqs.all(status: 'Pending')
    erb :'/spaces/view_requests'
  end

  post '/request' do
    req = Request.get(params[:req_id])
    req.update(status: params[:status])
    redirect '/users/my_account'
  end
end
