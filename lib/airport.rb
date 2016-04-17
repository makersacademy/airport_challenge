require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 2

  attr_reader :planes, :capacity, :weather

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
    #@weather = Weather.new
  end

  def land(plane)
    fail "Airport full" if full?
    fail "Too stormy to land" if stormy?
    fail "Plane already landed" if @planes.include?(plane)
    plane.landed
    @planes << plane
  end

  def take_off(plane)
    fail "Airport empty" if empty?
    fail "Plane not at airport" if @planes.include?(plane) == false
    plane.departed
    @planes.delete(plane)
  end

  private
  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

   def stormy?
      rand(10) >= 7
    end
   #
  #  def weather_generator
  #    @weather += rand(11)
  #  end


end
