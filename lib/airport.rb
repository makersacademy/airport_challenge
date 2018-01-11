require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full' if full?
    raise 'Plane has landed' if exist?(plane)
    weather_check
    confirm_landing(plane)
  end

  def take_off(plane)
    fail 'Airport is empty' if empty?
    fail 'Plane not at the airport' unless exist?(plane)
    weather_check
    confirm_take_off(plane)
  end

  def bad_weather
    Weather.new.stormy?
  end

  def weather_check
    fail 'Weather is affecting this flight' if bad_weather
  end

  def confirm_landing(plane)
    plane.landed
    planes << plane
    'This plane has landed'
  end

  def confirm_take_off(plane)
    plane.took_off
    planes.delete(plane)
    'This plane has taken off'
  end

  def exist?(plane)
    planes.include?(plane)
  end

  private

  def empty?
    planes.empty?
  end

  def full?
    planes.count >= capacity
  end

end
