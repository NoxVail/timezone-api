class TimezoneApi::Entities::Weather < Grape::Entity
  expose :tz_name, as: :identifier
  expose :coord, as: :coordinates
  expose :main, as: :weather
  expose :time do |instance|
    Time.now.in_time_zone(instance[:tz_name]).strftime('%a %b %e %T %Y')
  end
end
