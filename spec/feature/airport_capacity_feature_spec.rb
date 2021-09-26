require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'services/air_traffic_control'
require 'services/plane_management_service'
require 'services/airport_management_service'
require 'services/weather_service'
require 'factory/aeroplane_factory'
require 'factory/airport_factory'

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

describe 'Airport capacity setup feature' do
  it 'allows the designer to customise the airport capacity' do
    given_an_airport_with_a_custom_capacity(1)
    when_the_weather_is_clear
    and_the_airport_reaches_capacity
    then_another_plane_cannot_land(1)
  end
end
