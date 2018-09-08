class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land(plane)
    raise "#{plane.name} has already landed!" if @hangar.include?(plane)
    @hangar.push(plane)
    puts confirmation("landed", plane), display_hangar
  end

  def takeoff(plane)
    raise "#{plane.name} not in the hangar!" unless @hangar.include?(plane)
    @hangar.delete(plane) 
    puts confirmation("taken off", plane), display_hangar
  end

  # Make them private
  def confirmation(action, plane)
    "#{plane.name} has #{action}." 
  end

  def display_hangar
    return "There are no planes in the hangar." if @hangar.empty?
    names = @hangar.map { |plane| plane.name }
    "The hangar contains #{names.join(", ")}."
  end
end
