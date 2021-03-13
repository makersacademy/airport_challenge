# frozen_string_literal: true

require_relative './plane'
require_relative './weather' #refactor to have multi on one line

# OUTSTANDING - refactor esp tests.

# The main class of the entire programme. The other
# important interaction is with the Plane class ('require'd)
class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :airport_attributes

  def initialize(airport_id, capacity = DEFAULT_CAPACITY)
    @airport_attributes = {
      airport_id: airport_id,
      capacity: capacity,
      weather: Weather.new,
      planes: []
    }
  end

  def land(plane)
    raise 'Plane not airborne' if plane.plane_attributes[:airport_id] != 'IN TRANSIT/AIR'
    raise 'Airport full' if full?
    raise 'Weather is stormy' if @airport_attributes[:weather].weather_now == 'stormy'

    plane.plane_attributes[:airport_id] = @airport_attributes[:airport_id]
    @airport_attributes[:planes] << plane
  end

  def take_off(plane)
    raise 'Plane not present at this airport' unless @airport_attributes[:planes].include?(plane)
    raise 'Weather is stormy' if @airport_attributes[:weather].weather_now == 'stormy'

    plane.plane_attributes[:airport_id] = 'IN TRANSIT/AIR'
    @airport_attributes[:planes].delete(plane)
  end

  def full?
    @airport_attributes[:planes].count >= @airport_attributes[:capacity]
  end
end
