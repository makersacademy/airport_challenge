require_relative './plane.rb'

class Airport
  attr_reader :plane
  def initialize
    @@hangar = []
  end
  def hangar
    @@hangar
  end
  def land(plane)
    @@hangar.push(plane)
  end

  def take_off(plane)
  end
end

# Test creates a new instance of plane.
# The plane lands and should be pushed to the hangar array.
# The hangar array should contain the plane.

# I am having problems storing an array in a class.
# The plane instance is going into an array in the airport
# instance. I want a separate array.

# Do I need a class variable...?
