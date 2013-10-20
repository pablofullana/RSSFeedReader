require 'spec_helper'

describe Article do

  it { should respond_to(:title) }
  it { should respond_to(:link) }
  it { should respond_to(:description) }
  it { should respond_to(:pub_date) }
  it { should respond_to(:comments) }
  it { should respond_to(:starred) }

end