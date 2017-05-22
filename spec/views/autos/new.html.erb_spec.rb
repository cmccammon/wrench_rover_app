require 'rails_helper'

RSpec.describe "autos/new", type: :view do
  before(:each) do
    assign(:auto, Auto.new(
      :make => "MyString",
      :model => "MyString",
      :year => "MyString",
      :trim => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new auto form" do
    render

    assert_select "form[action=?][method=?]", autos_path, "post" do

      assert_select "input#auto_make[name=?]", "auto[make]"

      assert_select "input#auto_model[name=?]", "auto[model]"

      assert_select "input#auto_year[name=?]", "auto[year]"

      assert_select "input#auto_trim[name=?]", "auto[trim]"

      assert_select "input#auto_image[name=?]", "auto[image]"
    end
  end
end
