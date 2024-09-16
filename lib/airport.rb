require_relative '../lib/plane'

class Airport

  DEFAULT_CAPACITY = 10
  LAND_FULL_CAPACITY_ERR = 'Cannot land, airport at full capacity.'.freeze
  TAKEOFF_STORMY_WEATHER_ERR = 'Cannot take off, weather is stormy.'.freeze
  LAND_STORMY_WEATHER_ERR = 'Cannot land, weather is stormy.'.freeze
  PLANE_NOT_AT_AIRPORT_ERR = 'This plane is not at this airport.'.freeze

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @airport_capacity = capacity
    @planes = []
    @weather = weather
  end

  def take_off(plane)
    raise TAKEOFF_STORMY_WEATHER_ERR if stormy?
    raise PLANE_NOT_AT_AIRPORT_ERR if plane_not_at_airport(plane)
    remove_plane(plane.take_off)
  end

  def land(plane)
    raise LAND_STORMY_WEATHER_ERR if stormy?
    raise LAND_FULL_CAPACITY_ERR if airport_full?
    add_plane(plane.land)
  end

  def plane_inventory
    planes
  end

  private

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.delete_at(airport_location_of_plane(plane))
  end

  def plane_not_at_airport(plane)
    airport_location_of_plane(plane).nil?
  end

  def airport_location_of_plane(plane)
    planes.index { |landed_plane| landed_plane.object_id == plane.object_id } 
  end

  def airport_full?
    planes.size == airport_capacity
  end

  def stormy?
    weather.stormy?
  end

  attr_reader :planes, :airport_capacity, :weather

end
