class AjaxController < ApplicationController
  layout nil

  def like_travel
    travel = Travel.find(params[:id])
    if TravelsAction.create(action: 'like_travel', travel_id: travel.id, user_agent: request.user_agent, user_ip: get_ip, session_id: session.id).valid?
      travel.increment!(:like_count)
    end
    render nothing: true
  end

  def share_weibo
    travel = Travel.find(params[:id])
    if TravelsAction.create(action: 'share_weibo', travel_id: travel.id, user_agent: request.user_agent, user_ip: get_ip, session_id: session.id).valid?
      travel.increment!(:share_count)
    end
    render nothing: true
  end

end