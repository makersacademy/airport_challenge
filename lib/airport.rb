class Airport

  attr_accessor :capacity
  
  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'Unable to land plane: no empty spaces.' if full?
    @planes_landed << plane
  end

  def take_off(plane)
    puts 'Plane is no longer at the airport'
  end
  
  private

  def full?
    @planes_landed.length >= @capacity
  end

end