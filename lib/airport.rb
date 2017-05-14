require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 40

  attr_reader :capacity, :planes_on_ground, :iata_code

  def initialize(iata_code, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_on_ground = []
    @iata_code = iata_code
  end

  def land_plane(plane)
    raise 'Operation aborted: Weather is stormy' if stormy?
    raise 'Operation aborted: Airport is full' if full?
    raise 'The plane is already at #{@iata_code}' if plane.location == @iata_code
    @planes_on_ground.push(plane.land(self).tail_number)
  end

  def takeoff_plane(plane, destination)
    raise 'Operation aborted: Weather is stormy' if stormy?
    raise 'The plane is not at #{@iata_code}' if plane.location != @iata_code
    @planes_on_ground.delete(plane.takeoff(self).tail_number)
  end

  def stormy?
    rand(1..7) == 7 
    # Type of Weather
    # case
    # when 1
    #   @weather = "sunny"
    # when 2
    #   @weather = "partly cloudy"
    # when 3
    #   @weather = "cloudy"
    # when 4
    #   @weather = "rainy"
    # when 5
    #   @weather = "foggy"
    # when 6
    #   @weather = "windy"
    # when 7
    #   @weather = "stormy"
  end

  def full?
    planes_on_ground.length >= capacity
  end

end