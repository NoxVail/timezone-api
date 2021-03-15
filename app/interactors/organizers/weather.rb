class Organizers::Weather
  include Interactor::Organizer

  organize Shared::Authorization, User::WeatherApiResponse
end
