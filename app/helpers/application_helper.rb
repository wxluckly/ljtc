module ApplicationHelper
  def liked?(travel_id)
    return true if TravelsAction.where(action: 'like_travel', user_ip: get_ip, travel_id: travel_id, session_id: session.id).first
    false
  end

  def shared?(travel_id)
    return true if TravelsAction.where(action: 'share_travel', user_ip: get_ip, travel_id: travel_id, session_id: session.id).first
    false
  end
end
