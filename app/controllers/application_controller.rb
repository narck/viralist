class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    User.find(session[:user_id])
  end

  #def admin?
  #  redirect_to :back, notice:'admin privileges not detected' if not current_user.admin?
  #end

   def login_check 
    redirect_to login_path, notice:'Please log in!' if current_user.nil?
  end
end
