class TravelsController < ApplicationController
  def show
    @unfix = true
    @travel = Travel.publishing.find(params[:id])
    @travel.increment!(:read_count)
  end

  def index
    @travels = Travel.publishing.order('id desc').paginate(page: params[:page])
  end

end