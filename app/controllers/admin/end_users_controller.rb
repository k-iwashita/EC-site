class Admin::EndUsersController < ApplicationController
  def index
  end

  def show
    @user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
  end
end
