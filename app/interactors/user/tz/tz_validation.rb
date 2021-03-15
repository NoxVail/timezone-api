class User::Tz::TzValidation
  include Interactor

  def call
    identifiers = TZInfo::Timezone.all_identifiers
    context.fail!(error: 'one or more of your identifiers is invalid') unless context.timezones.all? { |tz| identifiers.include?(tz) }
  end
end
