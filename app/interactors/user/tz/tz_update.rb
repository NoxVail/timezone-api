class User::Tz::TzUpdate
  include Interactor

  def call
    uniq_tz = context.user.timezones.union(context.timezones)
    context.fail!(error: context.user.errors.full_messages) unless context.user.update(timezones: uniq_tz)

    context.result = { timezones: context.timezones }
  end
end
