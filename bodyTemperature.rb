require 'net/http'
require 'json'

def bodyTemperature(doctorName, diganosisId)
  url = URI('https://jsonmock.hackerrank.com/api/medical_records')
  response = JSON.parse(Net::HTTP.get(url))
  total_pages = response['total_pages']
  bodyTemps = []

  (1..total_pages).each do |page|
    query_params = { page: page }
    url.query = URI.encode_www_form(query_params)
    response_by_page = JSON.parse(Net::HTTP.get(url))
    response_by_page['data'].each do |user|
      next unless user.dig('doctor', 'name') == doctorName && user.dig('diagnosis', 'id') == diganosisId

      bodyTemps << user.dig('vitals', 'bodyTemperature')
    end
  end

  [bodyTemps.min.to_f, bodyTemps.max.to_f]
end
