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
    check_guard_clauses(plane)
    plane.cleared = true
    plane.land(self)
    @last_arrived = plane
  end

  def clear_for_takeoff(plane)
    check_guard_clauses(plane)
    plane.cleared = true
    plane.take_off(self)
    @last_departed = plane
  end

  private

  def wind_speed
    Kernel.rand(100)
  end

  def weather_conditions_safe?
    wind_speed < 90
  end

  def full?
    @planes_currently_landed.count >= @airport_capacity
  end

  def empty?
    @planes_currently_landed.empty?
  end

  def check_guard_clauses(plane)
    raise(NoPlanesError, "no planes are currently landed at #{self}!") if empty?
    raise(BadWeatherError, 'weather conditions unsafe for takeoff!') unless weather_conditions_safe?
    raise("#{plane} is not landed at #{self}!") unless @planes_currently_landed.include?(plane)
    raise("#{plane} is already landed at #{self}!") if @planes_currently_landed.include?(plane)
    true
  end

end

# For ad-hoc feature testing:

heathrow = Airport.new
gatwick = Airport.new
stansted = Airport.new
luton = Airport.new

b737 = Plane.new
a380 = Plane.new
b747 = Plane.new