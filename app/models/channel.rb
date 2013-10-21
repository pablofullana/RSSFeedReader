require 'net/http'
require 'simple-rss'
require 'open-uri'



class Channel < ActiveRecord::Base
	
  belongs_to :user
  has_many :articles, dependent: :destroy
  accepts_nested_attributes_for :articles

  validates :user_id, :url, :name, presence: true
  validate :valid_feed

  def fetch_feeds
    rss = SimpleRSS.parse open(self.url)
    rss.items.each do |item|
      attributes = {}
      attributes[:title] = item.title
      attributes[:link] = item.link
      attributes[:description] = item.description
      attributes[:pub_date] = item.pubDate
      attributes[:comments] = "Here is where comments go"
      attributes[:starred] = false
      attributes[:channel_id] = self.id
      
      begin
        article = Article.create_with(attributes).find_or_create_by(title: item.title)
      rescue
        # TODO - Define if this will be logged
      end
    end
  end


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
