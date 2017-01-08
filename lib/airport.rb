class Airport

  attr_reader :plane

  def land(plane)
    fail 'No slots available' if @plane
    @plane = plane
  end

  def take_off
    puts "plane taken off!"
  end
end
