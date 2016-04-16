class Airport

  require_relative 'plane'

  def initialize
    @planes = []
    @storm_level = 1
  end

  def land(plane)
    raise 'Airport full' if airport_full?
    @planes << plane
    plane.landed
  end

  def take_off(plane)
    raise 'All planes have taken off' if airport_empty?
    raise 'Plane cannot take off in stormy weather' if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def change_weather
    @storm_level = rand(10)
  end


  private

  def airport_full?
    @planes.length == 1
  end

  def airport_empty?
    @planes.empty?
  end

  def stormy?
    @storm_level >= 8
  end

end