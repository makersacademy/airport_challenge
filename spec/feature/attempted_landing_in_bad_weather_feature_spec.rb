require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'domain/aeroplane'
require 'domain/airport'
require 'factory/aeroplane_factory'
require 'services/weather_service'

describe 'Attempted landing in bad weather feature test' do
  it 'a plane cannot land at an airport in bad weather' do
    given_a_plane_waiting_to_land_at_an_airport
    and_bad_weather
    when_a_plane_tries_to_land
    then_the_plane_will_not_be_able_to_land
  end
end
