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
    @full_domain = case @domain
    when 'gmail.com' then 'https://mail.google.com'
    when 'qq.com' then 'https://mail.qq.com/cgi-bin/loginpage'
    when '163.com' then 'http://mail.163.com/'
    when '126.com' then 'http://mail.126.com/'
    when 'yahoo.cn' then 'https://login.yahoo.com/config/mail?&.src=ym&.intl=cn'
    else "http://#{@domain}"
    end

    render layout: 'full'
  end
end