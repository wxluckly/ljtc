class AreasController < ApplicationController
  def show
    @travels = Travel.publishing.where(area_id: params[:id]).paginate(page: params[:page])
  end
end