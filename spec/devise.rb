require 'spec_helper'

describe "Sign in page" do

  it "has expected links" do
  	visit new_user_session_path
  	page.should have_content("Sign up")
  	page.should have_content("Forgot your password?")
  	page.should have_content("Didn't receive your confirmation instructions?")
  	page.should have_content("Other login options:")
  end

end