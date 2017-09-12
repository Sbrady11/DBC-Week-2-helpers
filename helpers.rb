###Authentication Helpers###
helpers do
  # create user
  def create_user(params)
    user = User.new(params[:user])
    user.password = params[:password]
    user.save
    user
  end
  
  # log in
  def login(params)
    user = User.find_by(username: params[:username])
    if User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
    end
  end

  # get current user
  def current_user
    User.find_by(id: session[:user_id])
  end

  # path protection
  def logged_in?
    current_user ? true : false
  end

  def require_user
    redirect '/' unless logged_in?
  end

  # log out
  def logout
    session.clear
  end

  def authorized?(user)
    require_user
    current_user == user
  end
end
