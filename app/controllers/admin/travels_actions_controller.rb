class Admin::TravelsActionsController < Admin::BaseController
  def index
    @travels_actions = TravelsAction.where(travel_id: params[:travel_id]).order('id desc').paginate(page: params[:page])
  end
end
