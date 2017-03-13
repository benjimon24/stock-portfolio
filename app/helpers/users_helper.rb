module UsersHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login?
    !!current_user
  end

  def require_user
    redirect_to '/session/login' unless current_user
  end

  def authorized?
    session[:user_id] == @portfolio.user_id
  end

  def authorize_user
    redirect_to '/' unless authorized?
  end
end
