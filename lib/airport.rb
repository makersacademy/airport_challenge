class Plane

end


class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
    puts "Your plane #{plane} has landed in Manises airport and it is inside the hangar, ready for inspection."
    puts "These are all the planes in your airport:"
    p @hangar
  end

end
