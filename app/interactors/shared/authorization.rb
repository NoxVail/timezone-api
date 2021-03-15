class Shared::Authorization
  include Interactor

  def call
    token = context.token.split.last
    user(token)
    context.fail!(error: 'user not found') unless context.user
  end

  private

  def user(token)
    context.user = User.find_by(token: token)
  end
end
