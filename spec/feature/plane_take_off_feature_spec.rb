require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'domain/aeroplane'
require 'domain/airport'
require 'services/weather_service'

describe 'Plane take off feature test' do
  it 'a plane takes off from the airport' do
    given_an_airport_with_clear_weather
    and_a_plane_waiting_to_take_off
    when_the_plane_takes_off
    then_the_plane_will_no_longer_be_at_the_airport
  end
end