require 'plane'
require 'weather'

class Airport

  DEFAULT_CAPACITY = 3

  attr_accessor :hangar, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def request_landing(plane)
    full?
    check_weather
    plane.land(self)
  end

  def request_take_off(plane)
    empty?
    check_roster(plane)
    check_weather
    plane.take_off(self)
  end

  private

  def full?
    return raise "Hangar is full" if @hangar.length >= @capacity
  end

  def empty?
    return raise "Hangar is empty" if @hangar.empty?
  end

  def check_weather
    return raise "DANGER! STORMY WEATHER!" if Weather.new.status == "STORMY"
  end

  def check_roster(plane)
    return raise "Plane not in hangar" if !@hangar.include?(plane)
  end

end
