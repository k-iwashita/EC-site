class Public::EndUsersController < ApplicationController
  def show
    @user = EndUser.find(params[:id])
  end

  def update
  end

  def edit
  end

  def withdraw
  end

  def destroy
  end
end
