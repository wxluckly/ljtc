class User::TravelsController < User::BaseController
  def index
  end

  def draft
    @travels = current_user.travels.draft.unblocked.order('id desc')
  end

  def done
    @travels = current_user.travels.done.unblocked.order('id desc')
  end

  def new
    @travel = current_user.travels.new(event_id: params[:event_id])
    @show_event = params[:event_id].present? ? true : false
  end

  def create
    @travel = current_user.travels.new(travel_params.merge(is_verified: true))
    respond_to do |format|
      if @travel.save
        if @travel.is_finished?
          format.html { redirect_to done_user_travels_path }
        else
          format.html { redirect_to draft_user_travels_path }
        end
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @travel = current_user.travels.find(params[:id])
    @show_event = @travel.present? ? true : false
  end

  def update
    respond_to do |format|
      if current_user.travels.find(params[:id]).update(travel_params)
        format.html { redirect_to draft_user_travels_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def destroy
    @travel = current_user.travels.find(params[:id])
    @travel.update(is_blocked: true)
    TravelLog.create(travel_id: @travel.id, staffer_id: 0, action: 'blocked')
    render js: 'location.reload();'
  end

  private
  def travel_params
    params.require(:travel).permit(:title, :content, :sentiment, :line, :is_finished, :area_id, :cover, :event_id)
  end

end
