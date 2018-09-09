class Airport
  DEFAULT_CAPACITY = 4

  attr_reader :hangar, :capacity

  def initialize(capacity = Airport::DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  # Find a way to refactor stormy error in a way that can be tested in rspec
  def land(plane, weather = Weather)
    raise "#{plane.name} has already landed!" if @hangar.include?(plane)
    raise "No room in hangar!" if @hangar.size == @capacity
    raise "It is too stormy to do that!" if weather.new.stormy
    @hangar.push(plane)
    puts confirmation("landed", plane), display_hangar
  end

  def takeoff(plane, weather = Weather)
    raise "#{plane.name} not in the hangar!" unless @hangar.include?(plane)
    raise "It is too stormy to do that!" if weather.new.stormy
    @hangar.delete(plane) 
    puts confirmation("taken off", plane), display_hangar
  end

  private
  def confirmation(action, plane)
    "#{plane.name} has #{action}." 
  end

  def display_hangar
    return "There are no planes in the hangar." if @hangar.empty?
    names = @hangar.map { |plane| plane.name }
    "The hangar contains #{names.join(", ")}."
  end
end
