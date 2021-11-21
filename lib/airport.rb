class Airport

  def initialize(capacity)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'Unable to land plane: no empty spaces.' if @planes_landed.length >= @capacity
    @planes_landed << plane
  end

  def take_off(plane)
    puts 'Plane is no longer at the airport'
  end
  
end