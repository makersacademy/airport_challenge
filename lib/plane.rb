require_relative 'airport'
require_relative 'weather'

class Plane

  attr_reader :flying, :landed

  def initialize
    @flying = true
    @landed = false
  end

  def land(airport)
    fail 'Plane has already landed!' if landed
    fail 'Warning! Bad weather means plane cannot land.' if bad_weather
    @flying = false
    @landed = true
    airport.store(self)
  end

  def takeoff_from(airport)
    fail 'Plane cannot depart from airport it did not land at' unless airport.stored_planes.include?(self)
    fail 'Warning! Bad weather means plane cannot takeoff.' if bad_weather
    airport.stored_planes.delete(self)
    @landed = false
    @flying = true
    "#{self} has departed from #{airport}"
  end

  def bad_weather
    Weather.new.weather == "Stormy"
  end


end
