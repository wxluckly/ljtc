class WelcomeController < ApplicationController
  def index
    @selected_tarvels = Travel.where(event_id: 2).publishing.order('like_count desc').limit(4)
  end
end
