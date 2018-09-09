class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  # Find a way to refactor stormy error in a way that can be tested in rspec
  def land(plane, weather = Weather)
    raise "#{plane.name} has already landed!" if @hangar.include?(plane)
    raise "It is too stormy to do that!" if weather.new.stormy
    @hangar.push(plane)
    puts confirmation("landed", plane), display_hangar
  end

  def takeoff(plane , weather = Weather)
    raise "#{plane.name} not in the hangar!" unless @hangar.include?(plane)
    raise "It is too stormy to do that!" if weather.new.stormy
    @hangar.delete(plane) 
    puts confirmation("taken off", plane), display_hangar
  end

  private
  def confirmation(action, plane)
    "#{plane.name} has #{action}." 
  end

=begin
  def weather_check
    @weather = Weather.new.stormy
    raise "It is too stormy to do that!" if @weather
  end
=end

  def display_hangar
    return "There are no planes in the hangar." if @hangar.empty?
    names = @hangar.map { |plane| plane.name }
    "The hangar contains #{names.join(", ")}."
  end
end
