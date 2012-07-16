class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :campaign

  attr_accessible(:message_timestamp, :validity, :conn, :msisdn,
                  :guid, :shortcode)
  

  validates_presence_of :message_timestamp
  validates_presence_of :validity
  validates_presence_of :conn
  validates_presence_of :msisdn
  validates_presence_of :guid
  validates_presence_of :shortcode

  FIELDS_FORMAT = ["Campaign","Validity","Choice","CONN","MSISDN",
                   "GUID", "Shortcode"]

  scope :valid, where(:validity => "during")
  scope :invalid, where("validity != 'during'")
  scope :for_campaign, lambda {|campaign| joins(:campaign).where("campaigns.id = ?", campaign.id)}
end
