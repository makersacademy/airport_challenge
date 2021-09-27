
class Airport
  attr_accessor :terminal
  attr_accessor :capacity
  attr_accessor :weather
  def initialize
    @weather = 1
    @capacity = 10
    @terminal = []
  end
  
  def land(plane)
    weather = self.weather1(@weather)
    if weather == true
    if airport_full == false
    terminal.push(plane)
    else
      return "Airport is full, cannot land"
    end
  else return "Weather is bad"
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
    if terminal.size >= capacity
      return true
    else
      return false
    end
  end

  def overide_capacity(new_capacity)
   @capacity = capacity
  end

  def weather1(num)
  if num > 5
    return false
  else 
    return true
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