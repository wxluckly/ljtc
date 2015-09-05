class Admin::UsersController < Admin::BaseController
  def index
    @users = User.paginate(page: params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
end
