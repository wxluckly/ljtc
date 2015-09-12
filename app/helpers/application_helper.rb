module ApplicationHelper
  def liked?(travel_id)
    return true if TravelsAction.where(action: 'like_travel', session_id: session.id, travel_id: travel_id).first
    false
  end
end
