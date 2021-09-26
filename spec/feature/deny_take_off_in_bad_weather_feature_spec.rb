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
# To ensure safety
# I want to prevent takeoff when weather is stormy


describe 'Planes can take-off feature:' do
  it 'plane flys' do
    given_a_landed_plane_at_an_airport_managed_by_atc
    when_the_weather_is_bad
    then_the_plane_cannot_take_off
  end
end