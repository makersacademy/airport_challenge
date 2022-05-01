# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport

# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport 
# and confirm that it is no longer in the airport

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when the airport is full 

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

# As an air traffic controller 
# To ensure safety 
# I want to prevent takeoff when weather is stormy 

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

require_relative 'plane'

class Airport

  
  attr_accessor :dock, :capacity, :sunny

  DEFAULT_CAPACITY = 10

  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @dock = []
    rand > 0.2 ? @sunny = true : @sunny = false
  end

  def land(plane)
    raise "Airport dock is full" if full?

    stormy
    if @dock.include?(plane)
      docked(plane, "already")
    else
      if plane.flying == false
        "#{plane} is on the ground elsewhere"
      else
        plane.flying = false
        @dock << plane
      end
    end
  end

  def take_off(plane)
    stormy
    
    if !@dock.include?(plane)
      docked(plane, "not")
    else 
      plane.flying = true
      @dock.delete(plane)
      confirm_take_off(plane)
    end
  end
  
  def confirm_take_off(plane)
    !@dock.include?(plane) ? "Successful takeoff of: #{plane}" :
     docked(plane, "still")
  end

  private

  def full? 
    @dock.length >= @capacity
  end

  def stormy
    raise "Weather is stormy, abort!!!" if @sunny == false
  end

  def docked(plane, location)
    "#{plane} #{location} in dock"
  end
end
