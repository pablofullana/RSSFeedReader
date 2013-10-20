require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get channel_articles_path(:channel_id => '1')
      response.status.should be(200)
    end
  end
end
