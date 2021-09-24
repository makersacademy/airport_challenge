

class Airport
  attr_accessor :terminal
  def initialize
    
    @terminal = []
  end
  
  def land(plane)
    if airport_full == false
    terminal.push(plane)
    else
      return "Airport is full, cannot land"
    end
  end

  def take_off(plane,airport)
    if airport.search_plane(airport,plane) == true
      airport.terminal.delete_at(airport.terminal.find_index(plane))
      return "#{plane} has taken off"
    end
  end

  def search_plane(airport,plane)
    array = airport.terminal
    array.include?(plane)
  end

  def airport_full
    if terminal.size >= 10
      return true
    else
      return false
    end
  end

end

class Plane

end


lhr = Airport.new
plane = Plane.new
plane2 = Plane.new
lhr.land(plane)
puts lhr.terminal
puts lhr.search_plane(lhr,plane)
puts lhr.search_plane(lhr,plane2)
#puts lhr.terminal.find_index(plane)
lhr.take_off(plane,lhr)
#puts lhr.terminal.size
# array = [1,2,3]
# puts array.grep(4)






# class Plane
#   attr_reader :location
#   def land(airport)
#     @location = airport
#   end

#   def take_off(airport,plane)
#     if airport.terminal.grep(plane) == plane
#       puts "Take off"
#     else 
#       puts "plane not at airport"
#     end
#   end
# end