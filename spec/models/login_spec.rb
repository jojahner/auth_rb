require 'spec_helper'

describe Login do
  it "is not valid with no name" do
    subject.should have(1).error_on(:user)
  end
  
  it "is not valid with no application" do
    subject.should have(1).error_on(:application)
  end
end
