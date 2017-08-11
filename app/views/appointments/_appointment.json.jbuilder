json.extract! appointment, :id, :selected_appointment, :quote_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
