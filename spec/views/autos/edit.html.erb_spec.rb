require 'rails_helper'

RSpec.describe "autos/edit", type: :view do
  before(:each) do
    @auto = assign(:auto, Auto.create!(
      :make => "MyString",
      :model => "MyString",
      :year => "MyString",
      :trim => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit auto form" do
    render

    assert_select "form[action=?][method=?]", auto_path(@auto), "post" do

      assert_select "input#auto_make[name=?]", "auto[make]"

      assert_select "input#auto_model[name=?]", "auto[model]"

      assert_select "input#auto_year[name=?]", "auto[year]"

      assert_select "input#auto_trim[name=?]", "auto[trim]"

      assert_select "input#auto_image[name=?]", "auto[image]"
    end
  end
end
