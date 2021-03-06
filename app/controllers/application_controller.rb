class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    
    helper_method :current_user, :logged_in?
    
    def current_user
        #まずログインユーザーがいるか確認する、いなければ、以下のように定義 もしセッションにuse_idがあれば、セッション内のuser_idを頼りにfind
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    # !!とメソッド名? はセット。「ログインしてるか？」 もしcurrent_userがなければ
    def logged_in?
        !!current_user
    end
    
    def require_user
        #logged_in?がfalseなら
        if !logged_in?
            flash[:danger] = "You must be logged in to perform that action"
            redirect_to root_path
        end
    end
    
end


