class TravelsController < ApplicationController
  def show
    @unfix = true
    travel = Travel.find(params[:id])
    if current_user && travel.user_id == current_user.id
      @travel = travel
    else
      @travel = Travel.publishing.find(params[:id])
      @travel.increment!(:read_count)
    end
  end

  def index
    @travels = Travel.publishing.order('id desc').paginate(page: params[:page])
  end

end