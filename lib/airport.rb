require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = [] #array of planes in the airport
  end

  def land(plane)
    if plane.status == false
      raise "The plane is already in airport"
    else
      plane.status = false
      true
    end
  end

  def send(plane)
    if plane.status == true
      raise "The plane is already flying"
    else
      plane.status = true
      true
    end
  end
    #   @planes.delete(plane)
    #  puts "Airport is ready for sending #{plane} plane into the air"
    #  else


  end
