class User::Tz::TzDelete
  include Interactor

  def call
    context.fail!(error: 'you don\'t have any timezones') unless context.user.timezones.present?

    context.user.timezones = context.user.timezones - context.timezones
    context.fail!(error: context.user.errors.full_messages) unless context.user.save

    context.result = { timezones: context.timezones }
  end
end
