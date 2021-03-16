class User::Register::CreateUser
  include Interactor

  def call
    context.user = User.new(email: context.email, token: SecureRandom.uuid)
    context.fail!(error: context.user.errors.full_messages) unless context.user.save

    context.result = { token: context.user.token }
  end
end
