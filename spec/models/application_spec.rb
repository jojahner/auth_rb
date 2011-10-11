require 'spec_helper'

describe Application do
  it "fails validation with no name" do
    subject.should have(1).error_on(:name)
  end
  
  describe "after_create" do
    let(:subject) { Application.create(name: "TestApplication") }
    
    its(:key) { should_not be_nil }
    its(:secret_key) { should_not be_nil }
  end
end
