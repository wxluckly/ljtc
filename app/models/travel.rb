class Travel < ActiveRecord::Base
  # data ......................................................................
  cattr_accessor :areas
  self.areas = DbItem.new(
    list1: {label: '亚洲', desc: '亚洲',  value: '0'},
    list2: {label: '欧洲', desc: '欧洲',  value: '1'},
    list3: {label: '美洲', desc: '美洲',  value: '2'},
    list4: {label: '大洋洲', desc: '大洋洲',  value: '3'},
    list5: {label: '非洲', desc: '非洲',  value: '4'}
    )

  cattr_accessor :events
  self.events = DbItem.new(
    list1: {label: '我是最美风景', desc: '我是最美风景',  value: '1'},
    list2: {label: '最爱心中那一瞬', desc: '最爱心中那一瞬',  value: '2'},
    list3: {label: '舌尖上的全世界', desc: '舌尖上的全世界',  value: '3'},
    list4: {label: '跨越地球去体验', desc: '跨越地球去体验',  value: '4'}
    )

  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  belongs_to :user
  has_many :comments

  # validations ...............................................................
  # callbacks .................................................................
  before_save :clean_content
  before_save :calculate_score

  # scopes ....................................................................
  scope :draft, -> { where(is_finished: false) }
  scope :done, -> { where(is_finished: true) }
  scope :publishing, -> { where(is_finished: true, is_verified: true, is_blocked: false) }
  scope :unblocked, -> { where(is_blocked: false) }

  # additional config .........................................................
  mount_uploader :cover, CoverUploader

  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  protected
  def clean_content
    self.content = content.gsub('<wbr>', '')
  end

  def calculate_score
    self.score = (like_count || 0) + (share_count || 0)
  end

  # private instance methods ..................................................

end