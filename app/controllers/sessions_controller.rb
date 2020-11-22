class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Welcome: " + @user.email
      redirect_to home_index_path
    else
      flash[:alert] = "Email or password were invalid.  Please try again"
      render :new
    end
  end

  def destroy
  session[:user_id] = nil
  flash[:alert] = "Successfully logout, thank you !"
  redirect_to login_path
end

end
