class TimezoneApi::Entities::TimezonesDelete < Grape::Entity
  expose :timezones, as: :timezones_deleted
end
