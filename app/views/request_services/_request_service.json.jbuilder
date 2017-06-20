json.extract! request_service, :id, :service, :request_id, :created_at, :updated_at
json.url request_service_url(request_service, format: :json)
