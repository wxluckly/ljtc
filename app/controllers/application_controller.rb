class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_ip
    request.env["HTTP_X_FORWARDED_FOR"].try(:split, ',').try(:first) || request.env["REMOTE_ADDR"]
  end
end
