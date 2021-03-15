module TimezoneApi::Helpers::General
  def declared_params
    declared(params, include_missing: false)
  end
end
