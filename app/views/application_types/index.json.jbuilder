json.array!(@noapplications) do |noapplication|
  json.extract! noapplication, :id, :no_of_application, :path
  json.url noapplication_url(noapplication, format: :json)
end
