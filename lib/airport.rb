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
    raise "#{plane} not in airport" if !hangar.include?(plane)
  # "#{plane} left the airport"
    hangar.delete(plane)
  end

end

class AirTrafficController < Airport

  # inherited by Airport
  # checks if airport is full
  # checks airport weather
  # checks airport hangar
  # checks flight status
  
end
