class SubController < ApplicationController
  def event_one
    
  end

  def event_two
    
  end

  def event_three
    
  end

  def event_four
    
  end

  def qa
    
  end

  def sending_mail
    @code = session[:email].split('@').first
    @domain = session[:email].split('@').last
    render layout: 'full'
  end
end