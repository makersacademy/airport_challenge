class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
    puts "#{plane.name} has landed.\n#{display_hangar}"
  end

  def takeoff(plane)
    @hangar.delete(plane) 
    puts "#{plane.name} has taken off.\n#{display_hangar}"
  end

  private
  def display_hangar
    return "There are no planes in the hangar." if @hangar.empty?
    names = @hangar.map { |plane| plane.name }
    "The hangar contains #{names.join(", ")}."
  end
end
