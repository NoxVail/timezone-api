class User::Register::EmailPresence
  include Interactor

  def call
    context.fail!(error: 'user with this email already exists') if User.exists?(email: context.email)
  end
end
