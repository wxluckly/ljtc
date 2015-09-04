class Admin::TravelsController < Admin::BaseController
  def index
    @travels = Travel.done.paginate(page: params[:page])
  end
end
