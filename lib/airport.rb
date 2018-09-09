# Airport objects have @capacity and @hangar variables
# Airport objects have two public methods #land and #takeoff
# #land and #takeoff require Plane and Weather objects

class Airport
  DEFAULT_CAPACITY = 4

  attr_reader :hangar, :capacity

  def initialize(capacity = Airport::DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  # #land and #takeoff use Weather class in order generate value for 
  # stormy whenever called
  def land(plane, weather = Weather)
    raise "#{plane.name} has already landed!" if @hangar.include?(plane)
    raise "No room in hangar!" if @hangar.size == @capacity
    storm_check(weather)
    @hangar.push(plane)
    puts confirmation("landed", plane), display_hangar
  end

  def takeoff(plane, weather = Weather)
    raise "#{plane.name} not in the hangar!" unless @hangar.include?(plane)
    storm_check(weather)
    @hangar.delete(plane) 
    puts confirmation("taken off", plane), display_hangar
  end

  private
  def storm_check(weather)
    raise "It is too stormy to do that!" if weather.new.stormy
  end

  def confirmation(action, plane)
    "#{plane.name} has #{action}." 
  end

  def display_hangar
    return "There are no planes in the hangar." if @hangar.empty?
    names = @hangar.map { |plane| plane.name }
    "The hangar contains #{names.join(", ")}."
  end
end
