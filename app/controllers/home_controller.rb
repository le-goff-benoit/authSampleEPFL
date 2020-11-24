class HomeController < ApplicationController
  def index
    @user = current_user
    @reviews = Review.all
  end

  def login
  end

  def logout
  end

  def signin
  end
end
