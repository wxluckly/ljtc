class Admin::TravelsController < Admin::BaseController
  def index
    @travels = Travel.done.order('id desc').paginate(page: params[:page])
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def update
    respond_to do |format|
      if Travel.find(params[:id]).update(travel_params)
        format.html { redirect_to admin_travels_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def rank
    if params[:event_id].present?
      @event_id = (params[:event_id] || 1).to_i
      @travels = Travel.where(event_id: @event_id).done.order(clean_score: :desc).paginate(page: params[:page])
    else
      @event_id = nil
      @travels = Travel.where(event_id: nil).where(is_blocked: 0).order(clean_score: :desc).paginate(page: params[:page])
    end
  end

  def set_verified
    Travel.find(params[:id]).update(is_verified: true)
    render js: 'location.reload()'
  end

  def set_blocked
    Travel.find(params[:id]).update(is_blocked: true)
    TravelLog.create(travel_id: params[:id], staffer_id: current_staffer.id, action: 'blocked')
    render js: 'location.reload()'
  end

  def set_unblocked
    Travel.find(params[:id]).update(is_blocked: false)
    render js: 'location.reload()'
  end

  private
  def travel_params
    params.require(:travel).permit(:title, :content, :sentiment, :line, :is_finished, :area_id)
  end
end
