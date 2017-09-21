require 'rails_helper'

RSpec.describe "userpages/edit", type: :view do
  before(:each) do
    @userpage = assign(:userpage, Userpage.create!())
  end

  it "renders the edit userpage form" do
    render

    assert_select "form[action=?][method=?]", userpage_path(@userpage), "post" do
    end
  end
end
