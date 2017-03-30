class Account::MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movies = current_user.favorite_movies
  end
end
