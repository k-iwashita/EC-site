class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.with_deleted.all
  end

  def show
    @user = EndUser.find(params[:id])
  end

  def edit
  end

  def update
  end
end
