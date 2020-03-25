class Public::EndUsersController < ApplicationController
  def show
    @user = EndUser.find(params[:id])
  end

  def edit
    @user = EndUser.find(params[:id])
  end

  def update
    @user = EndUser.find(params[:id])
    if @user.update(end_user_params)
      redirect_to end_user_path(@user)
    else
      render :edit
    end
  end

  def withdraw
  end

  def destroy
    @user = EndUser.find(params[:id])
    @user.destroy
    redirect_to new_end_user_session_path
  end

  private
    def  end_user_params
      params.require(:end_user).permit(:family_name, :last_name, :family_name_kana, :last_name_kana, :email)
    end
end
