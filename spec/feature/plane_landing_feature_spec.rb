require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'domain/aeroplane'
require 'domain/airport'
require 'services/weather_service'

describe 'Plane landing feature test' do
  it 'a plane lands at the airport' do
    given_a_plane_waiting_to_land_at_an_airport
    and_clear_weather
    when_the_plane_lands
    then_the_plane_will_be_at_the_destination_airport
  end
end