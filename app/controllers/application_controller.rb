class ApplicationController < ActionController::Base
  helper_method :logged_in, :require_user
  def after_sign_in_path_for(resource)
    works_path # ログイン後に遷移するpathを設定
  end
 
  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
 end

 def logged_in
  !!current_user
 end

 def require_user
  if !logged_in
    flash[:alert] = 'You need to log in!'
    redirect_to new_user_session_path
 end
end

  
end
