class Airport 
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
  end

  def take_off(plane)
    fail "That plane has left the airport!" if empty?
    @planes.push(plane)
  end

  def empty?
    @planes.empty?
  end

  def weather
  end
end