require 'spec_helper'

describe "About page has a valid content" do
  
  it "Should be the about page" do
    visit home_about_path
    page.should have_content("About")
  end

end
