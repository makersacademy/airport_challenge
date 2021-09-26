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
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe 'Planes can take-off feature:' do
  it 'plane flys' do
    given_a_landed_plane_at_an_airport_managed_by_atc
    when_the_weather_is_clear
    then_the_plane_can_take_off
  end
end
