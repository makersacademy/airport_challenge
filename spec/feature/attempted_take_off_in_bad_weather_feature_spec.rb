require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'domain/aeroplane'
require 'domain/airport'
require 'services/weather_service'

describe 'Attempted take-off in bad weather feature test' do
  it 'a plane cannot take off in bad weather' do
    given_an_airport
    and_clear_weather
    and_a_plane_waiting_to_take_off
    and_bad_weather
    when_the_plane_tries_to_take_off
    then_the_plane_will_not_be_able_to_take_off
  end
end
