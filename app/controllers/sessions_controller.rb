class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:alert] = "Already logged as: " + @user.email
      redirect_to home_index_path
    end
  end

  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Welcome: " + @user.email
      redirect_to home_index_path
    else
      flash[:alert] = "Email or password were invalid. Please try again"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:alert] = "Successfully logout, thank you !"
    redirect_to login_path
  end

  private
  def review_params
    params.require(:title).permit(:body)
  end

end
