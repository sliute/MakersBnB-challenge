class MakersBnB < Sinatra::Base

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
    if (@user)
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.next[:errors] = ['Email and/or password are/is incorrect']
      redirect '/'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/spaces'
  end

end
