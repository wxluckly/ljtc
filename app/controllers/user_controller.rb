class UserController < ApplicationController
  layout 'application'
  
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    render js: 'location.reload();'
  end

  def edit_avatar
    @user = current_user
  end

  def update_avatar
    @user = current_user
    @user.update(user_params)
    redirect_to '/user/edit'
  end

  private
  def user_params
    params.require(:user).permit(:name, :mobile, :nickname, :password, :email, :avatar)
  end

end