class TravelsAction < ActiveRecord::Base
  validates :action, uniqueness: { scope: [:user_ip, :travel_id] }

end