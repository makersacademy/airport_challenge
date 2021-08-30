class Airport 
  DEFAULT_CAPACITY = 5
  attr_accessor :capacity
  attr_reader :plane, :airport

  def initialize(capacity=DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport is full" if @airport.length >= @capacity
    fail "Stormy weather: do not land" if weather? == "Stormy"
    @plane = plane
    @airport << @plane
  end

  def take_off(plane)
    fail "Stormy weather: do not fly" if weather? == "Stormy"
    fail "Plane not at airport" unless @airport.include?(@plane)
    @plane = plane
    @airport.each do |grounded_plane| 
      if grounded_plane == @plane && weather? == "Sunny"
        @airport.delete(@plane) 
        return "#{@plane} has departed"
      end
    end
  end

  def weather?
    weather = ["Sunny", "Sunny", "Sunny", "Stormy"]
    weather[rand(4)]
  end
end