require 'net/http'
require 'simple-rss'
require 'open-uri'



class Channel < ActiveRecord::Base
	
  belongs_to :user
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles

  validates :user_id, :url, :name, presence: true
  validate :valid_feed

  
  private

  def valid_feed
  	begin
      rss = SimpleRSS.parse open(URI.parse(url.to_s))
  		errors.add(:url, "is not a valid feed") unless rss.channel.title
  	rescue
  		errors.add(:url, "is not valid")
  	end
  end

end
