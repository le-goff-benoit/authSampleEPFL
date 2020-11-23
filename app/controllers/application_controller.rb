class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user, :can_view?

    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end

    def logged_in?
      !!current_user
    end

    def authorized
      redirect_to login_path unless logged_in?
    end

    def can_view?(id)
      redirect_to login_path unless (current_user.id == id)
    end
end
