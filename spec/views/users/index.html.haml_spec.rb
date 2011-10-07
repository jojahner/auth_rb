require 'spec_helper'

describe "users/index.html.haml" do
  before(:each) do
    assign(:users, [
      Factory.build(:user),
      Factory.build(:user)
    ])
  end

  it "renders a list of users" do
    render
  end
end
