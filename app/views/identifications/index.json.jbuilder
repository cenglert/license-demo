json.array!(@identifications) do |identification|
  json.extract! identification, :id, :user_id, :license_number
  json.url identification_url(identification, format: :json)
end
