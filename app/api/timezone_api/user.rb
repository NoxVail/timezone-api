class TimezoneApi::User < Grape::API
  helpers TimezoneApi::Helpers::General,
          TimezoneApi::Helpers::UserParams

  namespace :user do
    desc 'weather'
    get do
      interactor = Organizers::Weather.call(token: headers['Authorization'])
      error!(interactor.error) unless interactor.success?

      present interactor.result, with: TimezoneApi::Entities::Weather
    end

    desc 'registration'
    params do
      requires :email, type: String
    end
    post :register do
      interactor = Organizers::Registration.call(email: declared_params[:email])
      error!(interactor.error) unless interactor.success?

      present interactor.result, with: TimezoneApi::Entities::Registration
    end

    desc 'timezones addition'
    params { use :timezones }
    post :tz do
      interactor = Organizers::TimezonesAdd.call(token: headers['Authorization'], timezones: declared_params[:timezones])
      error!(interactor.error) unless interactor.success?

      present interactor.result, with: TimezoneApi::Entities::TimezonesAdd
    end

    desc 'timezones deletion'
    params { use :timezones }
    delete :tz do
      interactor = Organizers::TimezonesDelete.call(token: headers['Authorization'], timezones: declared_params[:timezones])
      error!(interactor.error) unless interactor.success?

      present interactor.result, with: TimezoneApi::Entities::TimezonesDelete
    end
  end
end
