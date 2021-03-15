module TimezoneApi::Helpers::UserParams
  extend Grape::API::Helpers

  params :timezones do
    requires :timezones, type: Array
  end
end
