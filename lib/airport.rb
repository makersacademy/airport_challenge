require_relative './plane.rb'

# Custom errors for use with Airport class:
class BadWeatherError < StandardError; end
class NoRoomError < StandardError; end
class NoPlanesError < StandardError; end

# Airport class:
class Airport
  attr_accessor(:planes_currently_landed)
  attr_reader(:airport_capacity)

  DEFAULT_CAPACITY = 70

  def initialize(airport_capacity = DEFAULT_CAPACITY)
    @airport_capacity = airport_capacity
    @planes_currently_landed = []
    @last_departed = nil
    @last_arrived = nil
  end

  def clear_for_landing(plane)
    raise(NoRoomError, "no room available at #{self}!") if full?
    raise(BadWeatherError, 'weather conditions unsafe for landing!') unless weather_conditions_safe?
    raise("#{plane} is already landed at #{self}!") if @planes_currently_landed.include?(plane)
    plane.land(self)
    @last_arrived = plane
    "Flight #{check_last_arrived} arrived safely."
  end

  def clear_for_takeoff(plane)
    raise(NoPlanesError, "no planes are currently landed at #{self}!") if empty?
    raise(BadWeatherError, 'weather conditions unsafe for takeoff!') unless weather_conditions_safe?
    raise("#{plane} is not currently landed at #{self}!") unless @planes_currently_landed.include?(plane)
    plane.take_off(self)
    @last_departed = plane
    "Flight #{check_last_departed} departed safely."
  end

  private

  def wind_speed
    Kernel.rand(100)
  end

  def weather_conditions_safe?
    wind_speed < 90 ? true : false
  end

  def check_last_arrived
    @last_arrived
  end

  def check_last_departed
    @last_departed
  end

  def full?
    @planes_currently_landed.count >= @airport_capacity
  end

  def empty?
    @planes_currently_landed.empty?
  end
end
