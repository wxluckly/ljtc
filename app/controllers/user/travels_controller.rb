class User::TravelsController < User::BaseController
  def index
  end

  def draft
    @travels = current_user.travels
  end

  def done
    @travels = current_user.travels
  end

  def new
    @travel = current_user.travels.new
  end

  def create
    @travel = current_user.travels.new(travel_params)
    respond_to do |format|
      if @travel.save
        format.html { redirect_to draft_user_travels_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  def edit
    @travel = current_user.travels.find(params[:id])
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

  private
  def travel_params
    params.require(:travel).permit(:title, :content, :sentiment, :line)
  end

end
