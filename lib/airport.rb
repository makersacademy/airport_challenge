require_relative 'plane'

class Airport
  attr_reader :hangar
  DEFAULT_CAPACITY = 20
  def initialize(hangar = DEFAULT_CAPACITY)
    @planes = []
    @hangar = hangar
  end
  def take_off
    fail 'No planes taking off' if @planes.empty?
    planes.pop
  end
  
  def land(plane)
    fail 'Airpot is full' if @planes.count >= 20
    planes << plane
  end
  
  private 
  
  attr_reader :planes
  
  def full?
    planes.count >= hangar
  end

  def empty?
    planes.empty?
  end
end
