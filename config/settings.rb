module Setting
  class Base < Settingslogic
    @@root = File.expand_path('../settings', __FILE__)
  end

  class Setting::Smtp < Setting::Base
    source "#{@@root}/smtp.yml"
    namespace Rails.env
  end
end
