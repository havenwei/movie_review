class ReviewsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  before_action :find_review_and_check_permission, :only => [:edit, :update, :destroy]
  def new
    @movie = Movie.find(params[:movie_id])
    if current_user.is_member_of?(@movie)
      @review = Review.new
    else
      redirect_to movie_path(@movie)
      flash[:warning] = "收藏电影后才能发表影评，请先收藏该电影！"
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.new(review_params)
    @review.movie = @movie
    @review.user = current_user

    if @review.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    if @review.update(review_params)
      redirect_to account_reviews_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to account_reviews_path, alert: "Review deleted"
  end

  private

  def find_review_and_check_permission
    @review = Review.find(params[:id])

    if current_user != @review.user
      redirect_to root_path, alert: "You have no permission."
    end
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
