require_relative 'plane'
require_relative 'weather'

class Airport

  MAX_CAPACITY = 10

  attr_reader :landed_planes, :capacity, :station

  def initialize(station = WeatherStation.new, capacity = MAX_CAPACITY)
    @landed_planes = []
    @station = station
    @capacity = capacity
  end

  def land(plane)
    raise "#{error_message_land} It's #{plane.flight_status}!" if should_not_land?(plane)
    raise "#{error_message_land} Stormy weather!" if stormy?
    raise "#{error_message_land} Airport is at capacity!" if at_capacity?
    plane.flight_status = :landed
    @landed_planes << plane
  end

  def takeoff(plane)
    raise "#{error_message_takeoff} It's #{plane.flight_status}!" if should_not_take_off?(plane)
    raise "#{error_message_takeoff} Stormy weather!" if stormy?
    plane.flight_status = :taken_off
    @landed_planes.delete(plane)
  end

  def present?(plane)
    @landed_planes.include?(plane)
  end

  private

  def error_message_land
    "Can't land plane!"
  end

  def error_message_takeoff
    "Can't take off plane!"
  end

  def should_not_land?(plane)
    plane.landed? || plane.taken_off?
  end

  def should_not_take_off?(plane)
    plane.flying? || plane.taken_off?
  end

  def stormy?
    @station.todays_weather == :stormy
  end

  def at_capacity?
    @landed_planes.length >= @capacity
  end

end
