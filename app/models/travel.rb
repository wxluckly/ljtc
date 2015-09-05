class Travel < ActiveRecord::Base
  scope :draft, -> { where(is_finished: false) }
  scope :done, -> { where(is_finished: true) }
  scope :publishing, -> { where(is_finished: true, is_verified: true, is_blocked: false) }

  mount_uploader :cover, CoverUploader

end