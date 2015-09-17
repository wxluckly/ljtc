class TravelsController < ApplicationController
  def show
    @unfix = true
    travel = Travel.find(params[:id])
    @comments = travel.comments.order('id desc').paginate(page: params[:page], per_page: 10)
    if current_user && travel.user_id == current_user.id
      @travel = travel
    else
      @travel = Travel.publishing.find(params[:id])
    end
    @travel.increment!(:read_count)
  end

  def index
    @travels = Travel.publishing.order('id desc').paginate(page: params[:page])
  end

end