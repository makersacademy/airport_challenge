require_relative './support/given'
require_relative './support/when'
require_relative './support/then'
require 'domain/aeroplane'
require 'domain/airport'
require 'services/weather_service'

describe 'Attempted landing at full airport feature test' do
  it 'a plane cannot land at an airport with max default capacity' do
    given_an_airport_with_clear_weather
    when_the_airport_is_at_capacity
    and_a_plane_tries_to_land
    then_the_plane_will_not_be_able_to_land
  end

  it 'a plane cannot land at an airport with a custom capacity' do
    given_an_airport_with_custom_capacity(5)
    and_clear_weather
    when_the_airport_is_at_the_custom_capacity(5)
    and_a_plane_tries_to_land
    then_the_plane_will_not_be_able_to_land
  end
end
