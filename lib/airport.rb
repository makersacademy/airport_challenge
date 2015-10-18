require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize
    @landed = Array.new
    @weather = Weather.new
  end

  attr_reader :landed, :weather

  def land(plane)
    raise "Cannot land - plane is already landed" if !plane.flying
      raise "Airport full - cannot land plane" if full?
        raise "Stormy weather - cannot land plane" if weather.weather_warning == "Stormy"
          plane.flying = false
          landed << plane
  end

  def take_off(plane)
    raise "Airport empty - cannot take off" unless !landed.empty?
      raise "Stormy weather - cannot take off" if weather.weather_warning == "Stormy"
        raise "This plane isn't at the airport" unless landed.include?(plane)
          plane.flying = true
          landed.delete(plane)
  end

  private

  def full?
    landed.length >= DEFAULT_CAPACITY ? true : false
  end

end
