class TravelsAction < ActiveRecord::Base
  validates :action, uniqueness: { scope: [:travel_id, :user_ip] }
  validates :action, uniqueness: { scope: [:travel_id, :session_id] }

end