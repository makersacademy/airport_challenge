require_relative './plane'

class Airport

  attr_reader :plane, :weather


  def initialize(capacity = 5, weather = rand(1..5))
    @capacity = capacity
    @planes_landed = []
    @weather = weather
  end

  def new_capacity(nr_planes)
    @capacity = nr_planes
    @capacity
  end

  def land(plane)
    fail "Can't land, Airport is at full capacity" if full?
    fail "Can't land, weather is stormy" if bad_weather
    @planes_landed << plane
    puts "#{plane} has landed"
    plane
  end

  def take_off(plane)
    fail "No planes in the airport" if empty?
    fail "Can't take off, weather is stormy" if bad_weather
    @planes_landed.pop
    puts "#{plane} has taken off"
    plane
  end

   def set_weather(n)
    @weather = n
    @weather
  end

  private

  def full?
    @planes_landed.size >= @capacity
  end
  
  def empty?
    @planes_landed.empty?
  end

  def bad_weather
    @weather == 1
  end

end