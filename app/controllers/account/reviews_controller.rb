class Account::ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reviews = current_user.reviews.latest
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to account_reviews_path, alert: "Review deleted"
  end  
end
