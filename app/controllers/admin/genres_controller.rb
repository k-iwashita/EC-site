class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    genre = Genre.new(name: params[:genre][:name])
    genre.valid_status = params[:genre][:valid_status].to_i
    genre.save
    redirect_to admin_genres_path
  end

  def edit

  end

  def update

  end
end
