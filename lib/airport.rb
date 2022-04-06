class Airport
 
  def initialize(capacity)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
   raise 'Unable to land plane: no empty spaces.' if @planes.length >= @capacity
   @planes << plane
  end

  def take_off(plane)
    puts 'MA DEC21 LEFT!'
  end

end