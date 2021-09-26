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
# I want to prevent landing when the airport is full


describe 'Airport full feature' do
  it 'stops a plane landing' do
    given_an_airport_full_of_planes
    when_the_weather_is_clear
    then_another_plane_cannot_land
  end
end