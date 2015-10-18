require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @landed = []
    @weather = Weather.new
  end

  attr_reader :landed, :weather

  def land(plane)
    raise "Airport full - cannot land plane" unless landed.empty?
      raise "Stormy weather - cannot land plane" if weather.weather_warning == "Stormy"
        landed << plane
  end

  def take_off(plane)
    raise "Airport empty - cannot take off" unless !landed.empty?
      raise "Stormy weather - cannot take off" if weather.weather_warning == "Stormy"
        raise "This plane isn't at the airport" unless landed.include?(plane)
          landed.delete(plane)
  end

end
