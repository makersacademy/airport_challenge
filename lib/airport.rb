# require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :capacity
  attr_reader :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = ["stormy", "sunny"].sample
    # @weather = Weather.new
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport full' if full?
    # if stormy?
    raise "landing not allowed" if stormy?
    # else
    plane.update_status("land")
    @planes << plane
    # puts @planes
    # end
  end

  def takeoff(plane)
    # puts stormy?
    raise "takeoff not allowed" if stormy?
    raise "plane not at this airport" if !in_hangar(plane)
      # return "takeoff not allowed"
    # else
    plane.update_status("air")
    @planes.delete(plane)
    # puts @planes
    # end
  end

  # def weather?
  #   puts @weather
  # end

  def stormy?
    @weather == "stormy"
  end

  def update_weather(weather)
    @weather = weather
  end

  def capacity?
    @capacity
  end

  def update_capacity
    true
  end

  def full?
    # puts @planes.count
    @planes.count >= @capacity
  end

  # def get_planes?
  #   # puts @planes
  #   @planes
  # end

  def in_hangar(plane)
    @planes.include?(plane)
  end

end
