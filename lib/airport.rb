require_relative 'plane'
 
class Airport
  CAPACITY = 14
  attr_reader :capacity, :hangar, :weather

  def initialize(capacity = CAPACITY)
    @capacity = capacity
    @hangar = []
    #@weather = rand(10)
  end

  def land(plane)
    fail 'Airport is full' if full?
    # fail 'Weather is stormy! do not land' unless safe?
    @hangar << plane
    plane.landed
  end

  def full?
    @hangar.size >= @capacity
  end

  def take_off(plane)
    fail 'this plane is not in this Airport' unless in_hangar?(plane)
    # fail 'Weather is stormy! please do try to land' unless safe?
    @hangar.pop
    plane.taken_off
  end

  def in_hangar?(plane)
    @hangar.include?(plane)
  end

  # def safe?
  #   raise 'Weather is stormy, please stand by' unless @weather < 7
  # end
end
