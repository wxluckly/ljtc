class AjaxController < ApplicationController
  layout nil

  def like_travel
    travel = Travel.find(params[:id])
    if TravelsLike.create(travel_id: travel.id, user_agent: request.user_agent, user_ip: get_ip, session_id: session.id)
      travel.increment!(:like_count)
    end
    render nothing: true
  end

end