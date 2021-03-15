class Organizers::TimezonesAdd
  include Interactor::Organizer

  organize Shared::Authorization, User::Tz::TzValidation, User::Tz::TzUpdate
end
