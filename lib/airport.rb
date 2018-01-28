require_relative 'plane'
require_relative 'weather'

class Airport 

  DEFAULT_CAPACITY = 20
  
  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Plane cannot land. Airport is full" if full?
    raise "Plane has already landed" if @planes.include?(plane)
    @planes << plane
  end

  def take_off(plane)
    # raise "The airport is empty" if empty?
    if @planes.include?(plane) 
      @planes.delete(plane)
      return "The plane has taken off and left the airport"
    else
    raise "The plane is not in this airport" if !@planes.include?(plane)
    end
    # raise "The airport is empty" if empty?
  end

private

  # def empty?
  #   @planes.empty?
  # end

  def full?
    @planes.count >= @capacity
  end

  def status
  end

end
