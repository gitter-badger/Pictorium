require 'rails_helper'

RSpec.describe "userpages/new", type: :view do
  before(:each) do
    assign(:userpage, Userpage.new())
  end

  it "renders new userpage form" do
    render

    assert_select "form[action=?][method=?]", userpages_path, "post" do
    end
  end
end
