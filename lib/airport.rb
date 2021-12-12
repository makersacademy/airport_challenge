class Airport 
  DEFAULT_CAPACITY = 5

  attr_accessor :capacity
  attr_reader :plane, :hangar
  
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @weather = weather
    @hangar = []
  end

  def land(plane)
    fail "Airport is full" if @hangar.length >= @capacity
    fail "Stormy weather: do not land" if weather? == "Stormy"
    @hangar << plane
  end

  def take_off(plane)
    fail "Stormy weather: do not fly" if weather? == "Stormy"
    fail "Plane not at airport" unless @hangar.include?(plane)
    @hangar.each do |grounded_plane| 
      if grounded_plane == plane && weather? == "Sunny"
        @hangar.delete(plane) 
        return "#{plane} has departed"
      end
    end
  end

  def weather?
    @weather.random_weather_generator
  end
end
