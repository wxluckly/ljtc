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

  private
  def user_params
    params.require(:user).permit(:name, :mobile)
  end

end