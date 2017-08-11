require 'rails_helper'

RSpec.describe "appointments/edit", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :selected_appointment => "MyString",
      :quote => nil
    ))
  end

  it "renders the edit appointment form" do
    render

    assert_select "form[action=?][method=?]", appointment_path(@appointment), "post" do

      assert_select "input#appointment_selected_appointment[name=?]", "appointment[selected_appointment]"

      assert_select "input#appointment_quote_id[name=?]", "appointment[quote_id]"
    end
  end
end
