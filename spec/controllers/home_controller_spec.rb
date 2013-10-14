require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      visit root_path
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      visit home_about_path
      response.should be_success
    end
  end

end
