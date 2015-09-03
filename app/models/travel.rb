class Travel < ActiveRecord::Base
  scope :draft, -> { where(is_published: false, is_blocked: false) }
  scope :done, -> { where(is_published: true, is_blocked: false) }

end