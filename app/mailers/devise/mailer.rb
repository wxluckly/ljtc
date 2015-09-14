class Devise::Mailer < ActionMailer::Base
  include Devise::Mailers::Helpers

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions_cn, opts)
  end

end