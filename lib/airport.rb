require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  attr_reader :landed
  DEFAULT_CAPACITY = 10

  def initialize
    @landed = []
  end


  def land(plane)
    fail "Cannot land - plane is already landed" unless plane.flying
    fail "Airport full - cannot land plane" if full?
    fail "Stormy weather - cannot land plane" if weather_warning == "Stormy"
      plane.flying = false
      landed << plane
  end

  def take_off(plane)
    fail "Airport empty - cannot take off" if landed.empty?
    fail "Stormy weather - cannot take off" if weather_warning == "Stormy"
    fail "This plane isn't at the airport" unless landed.include?(plane)
    plane.flying = true
    landed.delete(plane)
  end

  private

  def full?
    landed.length >= DEFAULT_CAPACITY ? true : false
  end

end
