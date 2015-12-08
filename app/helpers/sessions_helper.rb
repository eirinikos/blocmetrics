module SessionsHelper
  
  # the session method logs in the given user
  # by placing a temp cookie on the user's browser
  # containing an encrypted version of the user's id
  def log_in(user)
    session[:user_id] = user.id
  end

  # cookies.permanent[:remember_token] =
  # cookies[:remember_token] = {  value: remember_token,
  #                               expires: 20.years.from_now.utc }

  # remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # returns true if the given user is the current user
  def current_user?(user)
    user == current_user
  end

  # returns the current logged-in user (if any)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end

  # returns true if the user is logged-in
  def logged_in?
    !current_user.nil?
  end

  # forgets a persistent session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # redirects to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # stores the requested URL in the session variable
  # under the key `:forwarding_url` only for a GET request
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
