require 'net/http'
require 'feed_validator'



class Channel < ActiveRecord::Base
	
  belongs_to :user

  validates :user_id, :url, :name, presence: true
  validate :valid_url, :valid_feed

  
  private

  def valid_url
    begin
  		res = Net::HTTP.get_response(URI.parse(url.to_s))
  		if res.code.to_i != 200
  			errors.add(:url, "Got code " + res.code.to_s)
  		end
  	rescue
  		errors.add(:url, "is not valid")
  	end
  end

  def valid_feed
  	validator = W3C::FeedValidator.new()
  	validator.validate_url(url)
  	errors.add(:url, "is not a valid feed " + validator.to_s) unless validator.valid?
  end

end
