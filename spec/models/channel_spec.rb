require 'spec_helper'

describe Channel do

  let(:user) { FactoryGirl.create(:user) }
  before { @channel = user.channels.build(url: "url", name: "name") }

  subject { @channel }

  it { should respond_to(:url) }
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @channel.user_id = nil }
    it { should_not be_valid }
  end

  describe "with empty url" do
    before { @channel.url = "" }
    it { should_not be_valid }
  end

  describe "with empty name" do
    before { @channel.name = "" }
    it { should_not be_valid }
  end

end