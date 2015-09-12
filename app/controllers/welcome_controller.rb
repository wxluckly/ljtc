class WelcomeController < ApplicationController
  def index
    @selected_tarvels = Travel.publishing.order('like_count desc').limit(4)
  end
end
