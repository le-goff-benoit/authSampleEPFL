class ReviewsController < ApplicationController
  def index

  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    current_user.reviews << @review
    if @review.valid?
      flash[:alert] = "Thank you for adding this review !"
      redirect_to home_index_path
    else
      render :new
    end
  end


  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.permit(:title, :body, :image_url)

  end

end
