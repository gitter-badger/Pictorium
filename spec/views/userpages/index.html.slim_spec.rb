require 'rails_helper'

RSpec.describe "userpages/index", type: :view do
  before(:each) do
    assign(:userpages, [
      Userpage.create!(),
      Userpage.create!()
    ])
  end

  it "renders a list of userpages" do
    render
  end
end
