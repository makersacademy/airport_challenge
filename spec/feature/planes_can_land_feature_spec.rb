require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'services/air_traffic_control'
require 'services/plane_management_service'
require 'services/airport_management_service'
require 'services/weather_service'
require 'factory/aeroplane_factory'
require 'factory/airport_factory'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

describe 'Planes can land feature:' do
  it 'lands the plane' do
    given_a_plane_and_an_airport_managed_by_atc
    when_the_weather_is_clear
    then_the_plane_can_land
  end
end