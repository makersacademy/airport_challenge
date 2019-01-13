require_relative 'plane'

module Weather
    def current_weather?
    return "sunny" if rand(1..10).between?(1, 8)
    stormy
  end

def stormy?
  true
end
end

class Airport

  include Weather

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise "This plane has already landed" if @planes.include?(plane)
    @planes << plane
    @planes
  end


  def take_off(plane)

  fail "This plane cannot take off due to stormy weather" unless self.current_weather? == "sunny"
  @planes.delete(plane)

end
end
