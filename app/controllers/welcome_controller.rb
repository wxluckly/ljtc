class WelcomeController < ApplicationController
  def index
    @selected_tarvels = Travel.where(event_id: 4).publishing.order('like_count desc').limit(2)
  end
end
