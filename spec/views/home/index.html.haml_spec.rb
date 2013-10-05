require 'spec_helper'

describe "Home page has a valid content" do

  it "Should contain a proper welcome message for a not logged in user" do
  	visit root_path
  	page.should have_content("Welcome stranger")
  end
  
end
