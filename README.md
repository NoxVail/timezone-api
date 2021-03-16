# README

## To use this application you should do the following steps:

### development:

####preparation:
1. Clone repository: `git clone https://github.com/NoxVail/timezone-api`
2. Register and get a weather service API token here: https://openweathermap.org/
3. Install `docker` and `docker-compose`
4. Create a `.env` file and fill it according to `.env.example`
5. Build the app: `docker-compose build`
6. Create databases with `docker-compose run --rm app rails db:create`
7. Migrate created database with `docker-compose run --rm app rails db:migrate`
8. Install `postman` and import collection: https://www.postman.com/collections/3387edc1cc48c8dc1d12

####usage:
1. Start the app: `docker-compose up`
2. Send a `registration` request with `postman`
3. As a response you will get a token which you should send inside of each following request's header
4. Timezones should be specified in the following format: `Continent/City`
5. Add timezones: send `timezones add` request
6. Delete timezones: send `timezones delete` request
7. Get current weather from previously specified timezones: send `weather` request

### testing:

####preparation:
4. Create a `.env.test` file and fill it according to `.env.test.example`
5. Build the app: `docker-compose -f docker-compose.test.yml build`
   (don't forget to create and migrate databases afterwards)

####usage:
Start the app: `docker-compose -f docker-compose.test.yml up`
