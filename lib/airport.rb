class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    plane.land
    @hangar.push(plane)
  end

  def take_off(plane)
    fail 'No planes in airport' if @hangar.length <= 0
    fail 'Plane not in airport' if !@hangar.include? plane
    plane_index = @hangar.index(plane)
    @hangar.delete_at(plane_index)
    plane.take_off
    puts "#{plane} has left the airport"
    return plane
  end

end
