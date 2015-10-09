module ApplicationHelper
  def liked?(travel_id)
    return false if TravelsAction.new(action: 'like_travel', user_ip: get_ip, travel_id: travel_id, session_id: session.id).valid?
    true
  end

  def shared?(travel_id)
    return false if TravelsAction.new(action: 'share_travel', user_ip: get_ip, travel_id: travel_id, session_id: session.id).valid?
    true
  end
end
