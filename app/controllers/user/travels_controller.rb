class User::TravelsController < User::BaseController
  def index
    
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.new(travel_params)
    respond_to do |format|
      if @travel.save
        format.html { redirect_to user_travels_path }
        format.json { render :json => @json }
      else
        format.html { render action: :edit }
        format.json { render :json => @json }
      end
    end
  end

  private
  def travel_params
    params.require(:travel).permit(:title, :content)
  end

end
