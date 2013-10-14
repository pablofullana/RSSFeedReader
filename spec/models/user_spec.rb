require 'spec_helper'

describe User do
  def new_user(attributes = {})
    attributes[:login] ||= 'TestUser'
    attributes[:first_name] ||= 'Test'
    attributes[:last_name] ||= 'User'
    attributes[:email] ||= 'example@host.com'
    attributes[:password] ||= 'strong_password'
    attributes[:password_confirmation] ||= attributes[:password]
    User.new(attributes)
  end

  before(:each) do
     User.delete_all
   end

  it "should be valid" do
    new_user.should be_valid
  end

  it "should validate uniqueness of email" do
    new_user(:email => 'bar@example.com').save!
    new_user(:email => 'bar@example.com').should have(1).error_on(:email)
  end

  it "should validate uniqueness of username" do
    new_user(:login => 'uniquename').save!
    new_user(:login => 'uniquename').should have(1).error_on(:login)
  end

  it "should authenticate by username" do
    user = new_user(:login => 'foobar', :password => 'secretpassword')
    user.save!
    User.authenticate('foobar', 'secretpassword').should be_true
  end

  it "should not authenticate bad username" do
    User.authenticate('nonexisting', 'secretpassword').should be_false
  end

  it "should not authenticate bad password" do
    new_user(:login => 'foobar', :password => 'secretpassword').save!
    User.authenticate('foobar', 'badpassword').should be_false
  end
end