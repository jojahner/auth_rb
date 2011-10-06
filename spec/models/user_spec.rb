require 'spec_helper'

describe User do
  it "fails validation with no email" do
    User.new.should have(1).error_on(:email)
  end
  
  it "fails validation with no username" do
    User.new.should have(1).error_on(:username)
  end
end
