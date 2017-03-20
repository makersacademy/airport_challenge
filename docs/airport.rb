require './docs/plane.rb'

class Airport
  WEATHER = [:stormy, :clear, :clear, :clear]
  DEFAULT_CAPACITY = 5
  def initialize(skies = WEATHER.sample, capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = skies
  end

  attr_reader :hangar, :weather

  def land(plane)
    raise 'Cannot land plane: plane has already landed' unless plane.airborne
    raise 'Cannot land plane: condition is stormy. Check weather for update' if stormy?
    raise 'Cannot land plane: airport is full' if full?
    plane.ground
    hangar << plane
  end

  def take_off(plane)
    raise 'Cannot fly plane: condition is stormy. Check weather for update' if stormy?
    raise 'Cannot take off plane from this airport: plane is not in hangar' unless include?(plane)
    # !plane.airborne
    hangar.each {|docked_plane| return (hangar.slice!(hangar.index(plane))).fly}

  end

  def check_weather
    update_weather
  end

  def stormy?
    weather == :stormy
  end

  attr_reader :hangar, :weather

  private

attr_writer :weather

  def stormy?
    weather == :stormy
  end

  def full?
    hangar.length >= DEFAULT_CAPACITY
  end

  def update_weather
    self.weather = WEATHER.sample
  end

  def include?(plane)
    hangar.include?(plane)
  end
end
