require 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = [] #array of planes in the airport
  end

  def land(plane)
    if plane.status == "flying"
       planes << plane
       puts "Airport is ready for the landing of #{plane} plane"
    else
       raise "The plane is already in airport"
    end
  end

  def send(plane)
    if plane.status == "landed"
       planes.delete(plane)
      puts "Airport is ready for sending #{plane} plane into the air"
    else
      raise "The plane is not available"
    end
  end

end
