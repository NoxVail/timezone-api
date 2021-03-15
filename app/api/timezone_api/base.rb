class TimezoneApi::Base < Grape::API
  format :json
  prefix :api

  mount TimezoneApi::User
end
