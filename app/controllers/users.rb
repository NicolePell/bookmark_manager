get '/users/new' do
  	@user = User.new
  	erb :"users/new"
  end	

post '/users' do
  	@user = User.create(:email => params[:email],
  				:password => params[:password],
  				:password_confirmation => params[:password_confirmation])
  	if @user.save
  		session[:user_id] = @user.id
  		redirect to('/')

  	else
  		flash.now[:errors] = @user.errors.full_messages
  		erb :"users/new"
  	end	
  end	

get '/users/create_token' do
  @user = User.new
  erb :"users/create_token"
end 

post '/users/create_token' do
  email = params[:email]
  user = User.first(email: params[:email])
  token = user.create_new_token
  user.update(password_token: token,
  password_token_timestamp: user.create_new_timestamp)
  send_email(user)
  redirect to '/'

end

def send_email (user)
  puts user.inspect
end  
