class AreasController < ApplicationController
  def show
    @travels = Travel.publishing.where(area_id: params[:id]).order('id desc').paginate(page: params[:page])
  end
end