class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
		user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    	if user.persisted?
      		flash.notice = "You are now signed in through Google..."
      		sign_in_and_redirect user
    	else
      		session["devise.user_attributes"] = user.attributes
      		# flash.notice = "You are almost Done! Please provide a password to finish setting up your account"
      		redirect_to root_url
    	end
	end
end