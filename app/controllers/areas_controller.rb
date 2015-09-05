class AreasController < ApplicationController
  def show
    Travel.publishing.where(area_id: params[:id]).paginate(page: params[:page])
  end
end