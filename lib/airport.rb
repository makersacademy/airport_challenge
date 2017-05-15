require_relative './plane'
require_relative './custom_errors'

class Airport
  attr_accessor(:planes_currently_landed)
  attr_reader(:airport_capacity)

  DEFAULT_CAPACITY = 300

  def initialize(airport_capacity = DEFAULT_CAPACITY)
    @airport_capacity = airport_capacity
    @planes_currently_landed = []
    @last_departed = nil
    @last_arrived = nil
  end

  def clear_for_landing(plane)
    run_landing_guard_clauses(plane)
    plane.cleared = true
    plane.land(self)
    @last_arrived = plane
  end

  def clear_for_takeoff(plane)
    run_takeoff_guard_clauses(plane)
    plane.cleared = true
    plane.take_off(self)
    @last_departed = plane
  end

  private

  def wind_speed
    Kernel.rand(100)
  end

  def weather_conditions_safe?
    dangerous_wind_speed_threshold = 90
    wind_speed < dangerous_wind_speed_threshold
  end

  def full?
    @planes_currently_landed.count >= @airport_capacity
  end

  def empty?
    @planes_currently_landed.empty?
  end

  def run_landing_guard_clauses(plane)
    raise(NoRoomError, "there is no available space at #{self}") if full?
    raise(BadWeatherError, 'weather conditions unsafe for landing!') unless weather_conditions_safe?
    raise("#{plane} is already landed at #{self}!") if @planes_currently_landed.include?(plane)
  end

  def run_takeoff_guard_clauses(plane)
    raise(NoPlanesError, "no planes are currently landed at #{self}!") if empty?
    raise(BadWeatherError, 'weather conditions unsafe for takeoff!') unless weather_conditions_safe?
    raise("#{plane} is not landed at #{self}!") unless @planes_currently_landed.include?(plane)
  end

end
