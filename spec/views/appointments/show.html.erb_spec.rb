require 'rails_helper'

RSpec.describe "appointments/show", type: :view do
  before(:each) do
    @appointment = assign(:appointment, Appointment.create!(
      :selected_appointment => "Selected Appointment",
      :quote => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Selected Appointment/)
    expect(rendered).to match(//)
  end
end
