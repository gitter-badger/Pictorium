require 'rails_helper'

RSpec.describe "userpages/show", type: :view do
  before(:each) do
    @userpage = assign(:userpage, Userpage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
