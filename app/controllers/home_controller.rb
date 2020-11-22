class HomeController < ApplicationController
  def index
    @user = current_user
  end

  def login
  end

  def logout
  end

  def signin
  end
end
