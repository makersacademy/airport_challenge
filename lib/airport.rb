class Airport
  attr_reader :name
  attr_accessor :weather, :plane

  def initialize
# @name = name
    @weather = rand(6) > 4 ? "stormy" : "clear"
  end

  def land(plane)
    raise "Stormy weather preventing landing" if weather == "stormy"
    raise "Airport Full" if @plane != nil
    @plane = plane
  end
  
  def take_off(plane)
    raise "Stormy weather preventing take off" if weather == "stormy"
    raise "#{plane} not in airport" if @plane != plane
  # "#{plane} left the airport"
    @plane = nil
  end

end
