class Airport

  attr_accessor :plane

  def initialize
    @plane = []
  end

  def land(plane)
    @plane << plane
  end

  def take_off(plane)
    @plane.delete(plane)
    puts "#{plane} no longer in airport"
  end

end
