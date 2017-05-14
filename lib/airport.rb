require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :landed_planes

  def initialize (station = WeatherStation.new)
    @landed_planes = []
    @station = station
  end

  def land(plane)
    if plane.landed? || plane.taken_off? || @station.todays_weather == :stormy
      raise "Can't land plane!"
    else
      plane.flight_status = :landed
      @landed_planes << plane
    end
  end

  def takeoff(plane)
    if plane.flying? || plane.taken_off? || @station.todays_weather == :stormy
      raise "Can't take off plane!"
    else
      plane.flight_status = :taken_off
      @landed_planes.delete(plane)
    end
  end

  def present?(plane)
    @landed_planes.include?(plane)
  end

end
