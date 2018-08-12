class Airport
  attr_reader :name, :hangar
  attr_accessor :weather, :plane, :capacity

  DEFAULT_CAPACITY = 200

  def initialize(capacity = DEFAULT_CAPACITY)
  # @name = name
    @capacity = capacity
    @weather = rand(6) > 4 ? "stormy" : "clear"
    @hangar = []
  end

  def land(plane)
    raise "Stormy weather preventing landing" if weather == "stormy"
    raise "Airport Full" if @hangar.length >= capacity
    hangar << plane
  end
  
  def take_off(plane)
    raise "Stormy weather preventing take off" if weather == "stormy"
    raise "#{plane} not in airport" unless hangar.include?(plane)
    hangar.delete(plane)
  end

end

class AirTrafficController < Airport
  attr_reader :airport

  def initialize(airport = Airport.new)
    @airport = airport
  end

  def hangar_full?
    airport.hangar.length >= airport.capacity
  end

  def hangar_include?(plane)
    airport.hangar.include?(plane)
  end

  def stormy?
    weather == "stormy"
  end

  def flight_status(plane)
    plane.status
  end

  # inherited by Airport
  # checks if airport is full
  # checks airport weather
  # checks airport hangar for plane
  # checks flight status

end
