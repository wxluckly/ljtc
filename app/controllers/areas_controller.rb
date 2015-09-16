class AreasController < ApplicationController
  def show
    @travels = Travel.publishing.where(area_id: params[:id]).where('event_id is null').order('id desc').paginate(page: params[:page], per_page: 6)
    @travel_events = Travel.publishing.where(area_id: params[:id]).where('event_id is not null').order('id desc').paginate(page: params[:page], per_page: 6)
  end
end