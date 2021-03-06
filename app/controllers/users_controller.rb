class UsersController < ApplicationController
  before_action :authorized, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      flash[:alert] = "Welcome to our new user: " + @user.email
      redirect_to home_index_path
    else
      flash[:alert] = "Unable to create an account."
      render :new
    end
  end

  def show
      @user = current_user
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
