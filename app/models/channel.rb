class Channel < ActiveRecord::Base
	
  belongs_to :user

  validates :user_id, :url, :name, presence: true

end
