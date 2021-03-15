class Organizers::Registration
  include Interactor::Organizer

  organize User::Register::EmailPresence, User::Register::CreateUser
end
