class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :login, :first_name, :last_name, :email, presence: true, length: { maximum: 50 }
  validates :login, uniqueness: true

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  	data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
    	# I'll use the email as the "login" value and split "name" in "first name" and "last name"
        user = User.create(login: data["email"],
        			first_name: data["name"].split(" ")[0],
        			last_name: data["name"].split(" ")[1],
	    		   	email: data["email"],
	    		   	password: Devise.friendly_token[0,20],
	    		   	# avoid confirmation
	    		   	confirmed_at: Time.now
	    		  )
    end
    user
  end


  # for testing purpose
  def self.authenticate(username, password)
    user = User.find_for_authentication(:login => username)
    if user != nil
      return user.valid_password?(password)
    else
      return false
    end
  end
end
