class Airport

  attr_reader :planes
  attr_reader :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    todays_landing_weather = @weather.generate
    fail "There's a storm brewing. You can't land." if todays_landing_weather == "Stormy weather!"
    fail "The airport is full." if @planes.size >= 20
    print "Plane landed!"
    @planes << plane
  end

  def take_off
    # weather = Weather.new
    todays_weather = @weather.generate
    fail "There's a storm brewing and you can't fly off." if todays_weather == "Stormy weather!"
    print "Plane has taken off!"
    @planes.pop
  end

end

class Plane
  plane = Plane.new
end

class Weather

  def generate
    num = rand(5)
    if num == 1
      return "Sunny"
    elsif num == 2
      return "Light drizzle"
    elsif num == 3
      return "Apocalypitcally mild"
    else num == 4
      return "Stormy weather!"
    end
  end

end
