require 'net/http'
require 'feed_validator'



class Channel < ActiveRecord::Base
	
  belongs_to :user
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles

  validates :user_id, :url, :name, presence: true
  validate :valid_feed

  
  private

  def valid_feed
  	begin
  		res = Net::HTTP.get_response(URI.parse(url.to_s))
  		if res.code.to_i != 200
  			errors.add(:url, "Got code " + res.code.to_s)
  		else
  		  validator = W3C::FeedValidator.new()
  		  validator.validate_url(url)
  		  errors.add(:url, "is not a valid feed") unless validator.valid?
  		end
  	rescue
  		errors.add(:url, "is not valid")
  	end
  end

end
