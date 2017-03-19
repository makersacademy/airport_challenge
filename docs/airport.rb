require './docs/plane.rb'

class Airport
  WEATHER = [:stormy, :clear, :clear, :clear]
  DEFAULT_CAPACITY = 5
  def initialize(name="airport", skies = WEATHER.sample, capacity = DEFAULT_CAPACITY)
    @name = name
    @hangar = []
    @capacity = capacity
    @weather = skies
  end

  attr_reader :hangar, :weather

  def land(plane)
    raise 'Plane has already landed' unless plane.airborne
    raise 'Plane cannot land in stormy conditions' if stormy?
    raise 'Airport is full, plane cannot land' if full?
    plane.ground
    hangar << plane
  end

  def take_off(plane)
    raise 'Plane cannot take off in stormy conditions' if stormy?
    hangar.each {|docked_plane| return (hangar.slice!(hangar.index(plane))).fly if docked_plane == plane && !plane.airborne }
    raise 'Plane not in hangar'
  end

  def check_weather
    update_weather
  end

  def stormy?
    weather == :stormy
  end

  attr_reader :hangar, :weather

  private

  def stormy?
    weather == :stormy
  end

  def full?
    hangar.length >= DEFAULT_CAPACITY
  end

  def update_weather
    @weather = WEATHER.sample
  end

  def include?(plane)
    hangar.include?(plane)
  end
end
