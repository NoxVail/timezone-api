class User::WeatherApiResponse
  include Interactor

  EXPIRATION = 120.seconds.freeze
  URL = 'http://api.openweathermap.org/data/2.5/weather'.freeze

  def call
    context.result = Rails.cache.fetch(context.user.email, expires_in: EXPIRATION) { response_data }
  end

  private

  def response_data
    identifiers = context.user.timezones
    context.fail!(error: 'you don\'t have any timezones added') unless identifiers.present?

    token = ENV.fetch('OPENWEATHERMAP_TOKEN')
    identifiers.map do |identifier|
      response = Faraday.get(URL, { q: identifier.split('/').last, appid: token, units: 'metric' }).body
      JSON.parse(response).merge(tz_name: identifier).symbolize_keys
    end
  end
end
