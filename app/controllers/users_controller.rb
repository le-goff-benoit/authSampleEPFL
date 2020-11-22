class UsersController < ApplicationController
  before_action :authorized, only: [:show]
  before_validation :downcase_email


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
    @user = User.find(params[:id])
  end

  private

  def downcase_email
    self.email = email.downcase
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
