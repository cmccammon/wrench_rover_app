require 'rails_helper'

RSpec.describe "appointments/new", type: :view do
  before(:each) do
    assign(:appointment, Appointment.new(
      :selected_appointment => "MyString",
      :quote => nil
    ))
  end

  it "renders new appointment form" do
    render

    assert_select "form[action=?][method=?]", appointments_path, "post" do

      assert_select "input#appointment_selected_appointment[name=?]", "appointment[selected_appointment]"

      assert_select "input#appointment_quote_id[name=?]", "appointment[quote_id]"
    end
  end
end
