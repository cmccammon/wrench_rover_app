require 'rails_helper'

RSpec.describe "autos/show", type: :view do
  before(:each) do
    @auto = assign(:auto, Auto.create!(
      :make => "Make",
      :model => "Model",
      :year => "Year",
      :trim => "Trim",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Make/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Trim/)
    expect(rendered).to match(/Image/)
  end
end
