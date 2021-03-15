class Organizers::TimezonesDelete
  include Interactor::Organizer

  organize Shared::Authorization, User::Tz::TzValidation, User::Tz::TzDelete
end
