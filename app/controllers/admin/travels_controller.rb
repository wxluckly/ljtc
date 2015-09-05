class Admin::TravelsController < Admin::BaseController
  def index
    @travels = Travel.done.paginate(page: params[:page])
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def rank
    @travels = Travel.done.order(:like_count).paginate(page: params[:page])
  end

  def set_verified
    Travel.find(params[:id]).update(is_verified: true)
    render js: 'location.reload()'
  end

  def set_blocked
    Travel.find(params[:id]).update(is_blocked: true)
    render js: 'location.reload()'
  end

  def set_unblocked
    Travel.find(params[:id]).update(is_blocked: false)
    render js: 'location.reload()'
  end
end
