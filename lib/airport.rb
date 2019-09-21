require_relative 'plane'

class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 10)
    @planes = [] # list of current planes in airport
    @capacity = capacity
  end

  def land_plane(plane)
    raise "Plane currently in airport" if in_airport?(plane)

    raise "Airport full, no space to land" if full?

    stormy?
    raise "Too stormy to land" if @stormy

    @planes << plane # adds plane to list of planes currently in airport

  end

  def take_off(plane)
    raise "No planes in airport" if empty?

    raise "Plane not currently in airport" if in_airport?(plane) == false

    stormy?
    raise "Too stormy to take off!" if @stormy

    @planes.delete(plane) # removes plane from list of current airport planes
    "#{plane} has left the airport"
  end

  private
  # based on 1 in 5 chance, checks if weather is stormy
  def stormy?
    rand(1..5) == 5 ? @stormy = true : @stormy = false
  end

  # checks if number of planes currently in airport is greater than capacity
  def full?
    @planes.size >= @capacity
  end

  # checks if there are 0 planes in the airport
  def empty?
    @planes.size.zero?
  end

  # checks if given plane is in the airport
  def in_airport?(plane)
    @planes.include?(plane)
  end

  DEFAULT_CAPACITY = 10
end
