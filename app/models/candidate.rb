class Candidate < ActiveRecord::Base
  has_many :votes
  has_many :campaigns, :through => :votes
  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessible :name
end
