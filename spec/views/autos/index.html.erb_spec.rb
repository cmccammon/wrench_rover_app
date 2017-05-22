require 'rails_helper'

RSpec.describe "autos/index", type: :view do
  before(:each) do
    assign(:autos, [
      Auto.create!(
        :make => "Make",
        :model => "Model",
        :year => "Year",
        :trim => "Trim",
        :image => "Image"
      ),
      Auto.create!(
        :make => "Make",
        :model => "Model",
        :year => "Year",
        :trim => "Trim",
        :image => "Image"
      )
    ])
  end

  it "renders a list of autos" do
    render
    assert_select "tr>td", :text => "Make".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "Trim".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
