class History < ActiveRecord::Base
  attr_accessible :snapshot
  has_many :photos
end
